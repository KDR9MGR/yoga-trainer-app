import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/features/diet_plans/presentation/controllers/diet_plan_controller.dart';
import 'package:trainer_manager_pro/features/diet_plans/presentation/pages/create_diet_plan_page.dart';
import 'package:trainer_manager_pro/features/diet_plans/presentation/pages/diet_plan_details_page.dart';
import 'package:trainer_manager_pro/shared/domain/entities/diet_plan.dart';
import 'package:trainer_manager_pro/shared/presentation/widgets/app_bottom_navigation.dart';

class DietPlansPage extends ConsumerStatefulWidget {
  const DietPlansPage({super.key});

  @override
  ConsumerState<DietPlansPage> createState() => _DietPlansPageState();
}

class _DietPlansPageState extends ConsumerState<DietPlansPage> {
  final _supabase = Supabase.instance.client;
  String? _trainerId;

  @override
  void initState() {
    super.initState();
    _loadTrainerId();
  }

  Future<void> _loadTrainerId() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      final trainerResponse = await _supabase
          .from('trainers')
          .select('id')
          .eq('user_id', user.id)
          .maybeSingle();
      
      if (trainerResponse != null) {
        setState(() {
          _trainerId = trainerResponse['id'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_trainerId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Plans'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToCreateDietPlan(),
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }

  Widget _buildBody() {
    return Consumer(
      builder: (context, ref, child) {
        final dietPlansAsync = ref.watch(trainerDietPlansProvider(_trainerId!));
        
        return dietPlansAsync.when(
          data: (dietPlans) => _buildDietPlansList(dietPlans),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => _buildErrorState(error.toString()),
        );
      },
    );
  }

  Widget _buildDietPlansList(List<DietPlan> dietPlans) {
    if (dietPlans.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(trainerDietPlansProvider(_trainerId!));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dietPlans.length,
        itemBuilder: (context, index) {
          final dietPlan = dietPlans[index];
          return _buildDietPlanCard(dietPlan);
        },
      ),
    );
  }

  Widget _buildDietPlanCard(DietPlan dietPlan) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    dietPlan.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) => _handleMenuAction(value, dietPlan),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'view',
                      child: Row(
                        children: [
                          Icon(Icons.visibility),
                          SizedBox(width: 8),
                          Text('View Details'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              dietPlan.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildInfoChip(
                  icon: Icons.local_fire_department,
                  label: '${dietPlan.dailyCalories} cal/day',
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  icon: Icons.restaurant_menu,
                  label: '${dietPlan.mealPlans.length} meals',
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  icon: Icons.track_changes,
                  label: dietPlan.goal,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  'Created ${DateFormat('MMM dd, yyyy').format(dietPlan.createdAt)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No Diet Plans Yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first diet plan to help your clients reach their goals',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _navigateToCreateDietPlan,
            icon: const Icon(Icons.add),
            label: const Text('Create Diet Plan'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Error Loading Diet Plans',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.red[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              ref.invalidate(trainerDietPlansProvider(_trainerId!));
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(String action, DietPlan dietPlan) {
    switch (action) {
      case 'view':
        _navigateToDietPlanDetails(dietPlan);
        break;
      case 'edit':
        _navigateToEditDietPlan(dietPlan);
        break;
      case 'delete':
        _showDeleteConfirmation(dietPlan);
        break;
    }
  }

  void _navigateToCreateDietPlan() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateDietPlanPage(trainerId: _trainerId!),
      ),
    );
  }

  void _navigateToEditDietPlan(DietPlan dietPlan) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateDietPlanPage(
          trainerId: _trainerId!,
          dietPlan: dietPlan,
        ),
      ),
    );
  }

  void _navigateToDietPlanDetails(DietPlan dietPlan) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DietPlanDetailsPage(dietPlan: dietPlan),
      ),
    );
  }

  void _showDeleteConfirmation(DietPlan dietPlan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Diet Plan'),
        content: Text(
          'Are you sure you want to delete "${dietPlan.title}"? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteDietPlan(dietPlan);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _deleteDietPlan(DietPlan dietPlan) async {
    try {
      await ref.read(dietPlanControllerProvider.notifier).deleteDietPlan(dietPlan.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Diet plan deleted successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting diet plan: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
} 