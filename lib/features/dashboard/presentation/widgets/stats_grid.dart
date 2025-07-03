import 'package:flutter/material.dart';
import 'package:trainer_manager_pro/core/widgets/widgets.dart';

class StatsGrid extends StatelessWidget {
  final Map<String, dynamic> dashboardStats;
  final bool isLoading;

  const StatsGrid({
    super.key,
    required this.dashboardStats,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final stats = _getStatsData();
    
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
        return StatCard(
          title: stat['title'] as String,
          value: stat['value'] as String,
          icon: stat['icon'] as IconData,
          color: stat['color'] as Color,
          isLoading: isLoading,
          showTrend: true,
          trendValue: stat['trend'] as double?,
          onTap: stat['onTap'] as VoidCallback?,
        );
      },
    );
  }

  List<Map<String, dynamic>> _getStatsData() {
    return [
      {
        'title': 'Total Classes',
        'value': '${dashboardStats['total_classes'] ?? 0}',
        'icon': Icons.fitness_center,
        'color': Colors.blue,
        'trend': 12.5,
        'onTap': null,
      },
      {
        'title': 'Active Students',
        'value': '${dashboardStats['total_students'] ?? 0}',
        'icon': Icons.people,
        'color': Colors.green,
        'trend': 8.3,
        'onTap': null,
      },
      {
        'title': 'Diet Plans',
        'value': '${dashboardStats['total_diet_plans'] ?? 0}',
        'icon': Icons.restaurant_menu,
        'color': Colors.orange,
        'trend': 15.7,
        'onTap': null,
      },
      {
        'title': 'Monthly Revenue',
        'value': '\$${dashboardStats['monthly_revenue'] ?? 0}',
        'icon': Icons.attach_money,
        'color': Colors.purple,
        'trend': 22.1,
        'onTap': null,
      },
    ];
  }
} 