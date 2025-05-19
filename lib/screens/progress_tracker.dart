import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/progress_service.dart';
import '../models/progress.dart';

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressList = Provider.of<ProgressService>(context).progressList;
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Tracker')),
      body: progressList.isEmpty
          ? const Center(child: Text('No progress tracked yet.'))
          : ListView.builder(
              itemCount: progressList.length,
              itemBuilder: (context, index) {
                final progress = progressList[index];
                return ListTile(
                  title: Text('Date: ${progress.date.toLocal().toShortDateString()}'),
                  subtitle: Text('Mood: ${progress.mood}\nWeight: ${progress.weight}kg, BMI: ${progress.bmi}\nAttended: ${progress.attended ? 'Yes' : 'No'}'),
                  isThreeLine: true,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => _AddProgressDialog(),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Progress',
      ),
    );
  }
}

class _AddProgressDialog extends StatefulWidget {
  @override
  State<_AddProgressDialog> createState() => _AddProgressDialogState();
}

class _AddProgressDialogState extends State<_AddProgressDialog> {
  final _formKey = GlobalKey<FormState>();
  String mood = '';
  double weight = 60;
  double bmi = 20;
  bool attended = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Progress'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mood'),
              onSaved: (val) => mood = val ?? '',
              validator: (val) => val == null || val.isEmpty ? 'Enter mood' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              onSaved: (val) => weight = double.tryParse(val ?? '60') ?? 60,
              validator: (val) => val == null || double.tryParse(val) == null ? 'Enter weight' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'BMI'),
              keyboardType: TextInputType.number,
              onSaved: (val) => bmi = double.tryParse(val ?? '20') ?? 20,
              validator: (val) => val == null || double.tryParse(val) == null ? 'Enter BMI' : null,
            ),
            CheckboxListTile(
              title: const Text('Attended'),
              value: attended,
              onChanged: (val) => setState(() => attended = val ?? false),
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
              Provider.of<ProgressService>(context, listen: false).addProgress(
                Progress(
                  userId: 'u1',
                  date: DateTime.now(),
                  attended: attended,
                  mood: mood,
                  weight: weight,
                  bmi: bmi,
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

extension DateHelpers on DateTime {
  String toShortDateString() => '${this.day}/${this.month}/${this.year}';
}
