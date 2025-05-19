import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/diet_service.dart';
import '../models/diet_plan.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plans = Provider.of<DietService>(context).plans;
    return Scaffold(
      appBar: AppBar(title: const Text('Diet Plans')),
      body: plans.isEmpty
          ? const Center(child: Text('No diet plans available.'))
          : ListView.builder(
              itemCount: plans.length,
              itemBuilder: (context, index) {
                final plan = plans[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('${plan.planType} Plan'),
                    subtitle: Text('From: ${plan.startDate.toLocal().toShortDateString()}\nTo: ${plan.endDate.toLocal().toShortDateString()}'),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.download),
                          onPressed: () {}, // Download placeholder
                        ),
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {}, // Share placeholder
                        ),
                      ],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('${plan.planType} Plan Meals'),
                          content: Text(plan.meals.join('\n')),
                          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close'))],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Demo: Add a sample plan
          Provider.of<DietService>(context, listen: false).addPlan(
            DietPlan(
              id: 'd1',
              userId: 'u1',
              planType: 'Weekly',
              startDate: DateTime.now(),
              endDate: DateTime.now().add(const Duration(days: 7)),
              meals: ['Breakfast: Oats', 'Lunch: Salad', 'Dinner: Soup'],
              downloadableUrl: null,
            ),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Demo Plan',
      ),
    );
  }
}

extension DateHelpers on DateTime {
  String toShortDateString() => '${this.day}/${this.month}/${this.year}';
}
