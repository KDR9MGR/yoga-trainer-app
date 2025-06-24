import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainer_manager_pro/shared/domain/entities/diet_plan.dart';

class DietPlanDetailsPage extends StatelessWidget {
  final DietPlan dietPlan;

  const DietPlanDetailsPage({
    super.key,
    required this.dietPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dietPlan.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareDietPlan(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderCard(context),
            _buildGoalCard(context),
            _buildMacrosCard(context),
            if (dietPlan.restrictions?.isNotEmpty == true) _buildRestrictionsCard(context),
            _buildMealPlansCard(context),
            if (dietPlan.notes?.isNotEmpty == true) _buildNotesCard(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dietPlan.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              dietPlan.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
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
                if (dietPlan.updatedAt != null) ...[
                  const SizedBox(width: 16),
                  Icon(Icons.update, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    'Updated ${DateFormat('MMM dd, yyyy').format(dietPlan.updatedAt!)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.track_changes, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  'Goal & Calories',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    context,
                    'Goal',
                    _formatGoal(dietPlan.goal),
                    Icons.track_changes,
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    context,
                    'Daily Calories',
                    '${dietPlan.dailyCalories} cal',
                    Icons.local_fire_department,
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMacrosCard(BuildContext context) {
    final protein = dietPlan.macros['protein']?.toDouble() ?? 0;
    final carbs = dietPlan.macros['carbs']?.toDouble() ?? 0;
    final fats = dietPlan.macros['fats']?.toDouble() ?? 0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.pie_chart, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  'Macronutrients',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMacroBar('Protein', protein, Colors.red, context),
            const SizedBox(height: 12),
            _buildMacroBar('Carbohydrates', carbs, Colors.orange, context),
            const SizedBox(height: 12),
            _buildMacroBar('Fats', fats, Colors.blue, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMacroBar(String name, double percentage, Color color, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: Theme.of(context).textTheme.bodyMedium),
            Text('${percentage.toInt()}%', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ],
    );
  }

  Widget _buildRestrictionsCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.block, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  'Dietary Restrictions',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: dietPlan.restrictions!.map((restriction) {
                return Chip(
                  label: Text(restriction),
                  backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealPlansCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.restaurant_menu, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  'Meal Plans',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...dietPlan.mealPlans.map((mealPlan) => _buildMealPlanItem(context, mealPlan)),
          ],
        ),
      ),
    );
  }

  Widget _buildMealPlanItem(BuildContext context, DietMealPlan mealPlan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatMealType(mealPlan.mealType),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${mealPlan.calories} cal',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${mealPlan.items.length} food items',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          if (mealPlan.items.isNotEmpty) ...[
            const SizedBox(height: 8),
            ...mealPlan.items.map((item) => _buildFoodItem(context, item)),
          ],
        ],
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, DietMealItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${item.foodName} (${item.quantity})',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Text(
            '${item.calories} cal',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.notes, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  'Notes',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              dietPlan.notes!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatGoal(String goal) {
    return goal.split('_').map((word) => 
        word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  String _formatMealType(String mealType) {
    return mealType[0].toUpperCase() + mealType.substring(1);
  }

  void _shareDietPlan(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Diet plan sharing functionality coming soon!'),
      ),
    );
  }
} 