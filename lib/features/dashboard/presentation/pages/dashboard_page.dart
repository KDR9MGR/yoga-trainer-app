import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/core/widgets/widgets.dart';
import 'package:trainer_manager_pro/features/dashboard/presentation/widgets/welcome_section.dart';
import 'package:trainer_manager_pro/features/dashboard/presentation/widgets/stats_grid.dart';
import 'package:trainer_manager_pro/shared/presentation/widgets/app_bottom_navigation.dart';
 
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});
 
  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final _supabase = Supabase.instance.client;
  Map<String, dynamic> _dashboardStats = {};
  List<Map<String, dynamic>> _upcomingClasses = [];
  List<Map<String, dynamic>> _recentEnrollments = [];
  bool _isLoading = true;
  String _trainerName = '';

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    try {
      setState(() => _isLoading = true);
      
      final user = _supabase.auth.currentUser;
      if (user == null) {
        setState(() => _isLoading = false);
        return;
      }

      // First, ensure trainer exists in database
      final trainerResponse = await _supabase
          .from('trainers')
          .select('*')
          .eq('user_id', user.id)
          .maybeSingle();

      String trainerId;
      
      if (trainerResponse == null) {
        // Create trainer record if it doesn't exist
        final newTrainer = await _supabase
            .from('trainers')
            .insert({
              'user_id': user.id,
              'email': user.email,
              'full_name': user.userMetadata?['full_name'] ?? 'Trainer',
            })
            .select()
            .single();
        trainerId = newTrainer['id'];
        _trainerName = newTrainer['full_name'] ?? 'Trainer';
      } else {
        trainerId = trainerResponse['id'];
        _trainerName = trainerResponse['full_name'] ?? 'Trainer';
      }

      // Get dashboard stats from view or create default stats
      final trainerStatsResponse = await _supabase
          .from('trainer_dashboard_stats')
          .select('*')
          .eq('user_id', user.id)
          .maybeSingle();

      // If no stats found, create default stats
      final stats = trainerStatsResponse ?? {
        'trainer_id': trainerId,
        'user_id': user.id,
        'full_name': _trainerName,
        'email': user.email,
        'total_classes': 0,
        'active_students': 0,
        'monthly_earnings': 0.0,
        'average_rating': 0.0,
      };

      // Get upcoming classes
      final upcomingClassesResponse = await _supabase
          .from('classes')
          .select('*')
          .eq('trainer_id', trainerId)
          .gte('start_time', DateTime.now().toIso8601String())
          .order('start_time', ascending: true)
          .limit(5);

      // Get recent enrollments
      final recentEnrollmentsResponse = await _supabase
          .from('enrollments')
          .select('''
            *,
            students!inner(full_name, email),
            classes!inner(title, start_time)
          ''')
          .eq('classes.trainer_id', trainerId)
          .order('enrolled_at', ascending: false)
          .limit(5);

      setState(() {
        _dashboardStats = stats;
        _upcomingClasses = List<Map<String, dynamic>>.from(upcomingClassesResponse);
        _recentEnrollments = List<Map<String, dynamic>>.from(recentEnrollmentsResponse);
        _isLoading = false;
      });
    } catch (e) {
      // Log error for debugging in development only
      if (kDebugMode) {
        print('Dashboard error: $e');
      }
      setState(() {
        _isLoading = false;
        // Set default empty data
        _dashboardStats = {
          'full_name': 'Trainer',
          'total_classes': 0,
          'active_students': 0,
          'monthly_earnings': 0.0,
          'average_rating': 0.0,
        };
        _trainerName = 'Trainer';
        _upcomingClasses = [];
        _recentEnrollments = [];
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Welcome! Your dashboard is ready. Add your first class to get started.'),
            backgroundColor: Colors.blue,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ModularAppBar(
        title: 'Dashboard',
        showBackButton: false,
      ),
      body: _isLoading
          ? const LoadingWidget(message: 'Loading dashboard...')
          : RefreshIndicator(
              onRefresh: _loadDashboardData,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeSection(trainerName: _trainerName),
                    const SizedBox(height: 24),
                    const SectionHeader(title: 'Statistics'),
                    const SizedBox(height: 16),
                    StatsGrid(
                      dashboardStats: _dashboardStats,
                      isLoading: false,
                    ),
                    const SizedBox(height: 24),
                    _buildUpcomingClasses(),
                    const SizedBox(height: 24),
                    _buildRecentEnrollments(),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }





  Widget _buildUpcomingClasses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Classes',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to classes page
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (_upcomingClasses.isEmpty)
          Container(
            padding: const EdgeInsets.all(32),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.event_available,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No upcoming classes',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create a new class to get started',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          )
        else
          ...List.generate(_upcomingClasses.length, (index) {
            final classData = _upcomingClasses[index];
            final startTime = DateTime.parse(classData['start_time']);
            final endTime = DateTime.parse(classData['end_time']);
            
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: const Border(
                  left: BorderSide(
                    width: 4,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.self_improvement,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          classData['title'] ?? 'Unnamed Class',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${DateFormat('MMM dd').format(startTime)} • ${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${classData['current_participants'] ?? 0}/${classData['max_participants'] ?? 0} students enrolled',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }

  Widget _buildRecentEnrollments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Enrollments',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to students page
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (_recentEnrollments.isEmpty)
          Container(
            padding: const EdgeInsets.all(32),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.person_add,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No recent enrollments',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          )
        else
          ...List.generate(_recentEnrollments.length, (index) {
            final enrollment = _recentEnrollments[index];
            final enrolledAt = DateTime.parse(enrollment['enrolled_at']);
            
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          enrollment['students']['full_name'] ?? 'Unknown Student',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Enrolled in ${enrollment['classes']['title'] ?? 'Unknown Class'}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateFormat('MMM dd').format(enrolledAt),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }
} 