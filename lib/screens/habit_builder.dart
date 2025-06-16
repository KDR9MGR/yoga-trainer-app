import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/habit_service.dart';
import '../models/habit.dart';

class HabitBuilderScreen extends StatelessWidget {
  const HabitBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final habits = Provider.of<HabitService>(context).habits;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Habit Builder'),
      ),
      body: habits.isEmpty
          ? const Center(child: Text('No habits set yet.'))
          : ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return ListTile(
                  title: Text(habit.habitName),
                  subtitle: Text('Frequency: ${habit.frequency}\nCompleted: ${habit.completedDates.length} times'),
                  isThreeLine: true,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => _AddHabitDialog(),
          );
        },
        tooltip: 'Add Habit',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AddHabitDialog extends StatefulWidget {
  @override
  State<_AddHabitDialog> createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<_AddHabitDialog> {
  final _formKey = GlobalKey<FormState>();
  String habitName = '';
  String frequency = 'daily';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Habit'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Habit Name'),
              onSaved: (val) => habitName = val ?? '',
              validator: (val) => val == null || val.isEmpty ? 'Enter habit name' : null,
            ),
            DropdownButtonFormField<String>(
              value: frequency,
              items: const [
                DropdownMenuItem(value: 'daily', child: Text('Daily')),
                DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
              ],
              onChanged: (val) => setState(() => frequency = val ?? 'daily'),
              decoration: const InputDecoration(labelText: 'Frequency'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Provider.of<HabitService>(context, listen: false).addHabit(
                Habit(
                  userId: 'u1',
                  habitName: habitName,
                  frequency: frequency,
                  completedDates: [],
                ),
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
