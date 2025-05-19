import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/trainer_provider.dart';
import '../models/trainer.dart';

class ActivitySearchScreen extends StatefulWidget {
  const ActivitySearchScreen({Key? key}) : super(key: key);

  @override
  State<ActivitySearchScreen> createState() => _ActivitySearchScreenState();
}

class _ActivitySearchScreenState extends State<ActivitySearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final trainers = Provider.of<TrainerProvider>(context).trainers;
    final filtered = trainers.where((t) {
      final q = query.toLowerCase();
      return t.name.toLowerCase().contains(q) ||
          t.specializations.any((s) => s.toLowerCase().contains(q)) ||
          t.schedule.any((s) => s.toLowerCase().contains(q));
    }).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by yoga type, trainer, goal...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) => setState(() => query = val),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No results.'))
                : ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final trainer = filtered[index];
                      return ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage(trainer.imageUrl)),
                        title: Text(trainer.name),
                        subtitle: Text(trainer.specializations.join(', ')),
                        onTap: () => Navigator.pushNamed(context, '/trainer_profile', arguments: trainer),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
