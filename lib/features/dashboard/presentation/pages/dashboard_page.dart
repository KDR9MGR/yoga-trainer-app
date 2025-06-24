import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
      appBar: AppBar(
        title: const Text('Dashboard'),
        //backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadDashboardData,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildWelcomeSection(),
                    const SizedBox(height: 24),
                    _buildStatsCards(),
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

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, ${_trainerName.split(' ').first}!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Here\'s what\'s happening with your yoga classes today',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.self_improvement,
            size: 60,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards() {
    final stats = [
      {
        'title': 'Total Classes',
        'value': (_dashboardStats['total_classes'] ?? 0).toString(),
        'icon': Icons.fitness_center,
        'color': Colors.blue,
      },
      {
        'title': 'Active Students',
        'value': (_dashboardStats['active_students'] ?? 0).toString(),
        'icon': Icons.people,
        'color': Colors.green,
      },
      {
        'title': 'This Month',
        'value': '\$${(_dashboardStats['monthly_earnings'] ?? 0).toStringAsFixed(0)}',
        'icon': Icons.attach_money,
        'color': Colors.purple,
      },
      {
        'title': 'Average Rating',
        'value': (_dashboardStats['average_rating'] ?? 0.0).toStringAsFixed(1),
        'icon': Icons.star,
        'color': Colors.orange,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    stat['icon'] as IconData,
                    color: stat['color'] as Color,
                    size: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: (stat['color'] as Color).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.trending_up,
                      size: 12,
                      color: stat['color'] as Color,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stat['value'] as String,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: stat['color'] as Color,
                    ),
                  ),
                  Text(
                    stat['title'] as String,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
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