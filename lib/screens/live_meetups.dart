import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/meetup_service.dart';

class LiveMeetupsScreen extends StatelessWidget {
  const LiveMeetupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meetups = Provider.of<MeetupService>(context).meetups;
    return Scaffold(
      appBar: AppBar(title: const Text('Live Meetups')),
      body: meetups.isEmpty
          ? const Center(child: Text('No meetups scheduled.'))
          : ListView.builder(
              itemCount: meetups.length,
              itemBuilder: (context, index) {
                final meetup = meetups[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(meetup.title),
                    subtitle: Text('Date: ${meetup.date.toLocal().toShortDateString()}\n${meetup.description}'),
                    isThreeLine: true,
                    trailing: ElevatedButton(
                      onPressed: () {}, // Register placeholder
                      child: const Text('Register'),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(meetup.title),
                          content: const Text('Q&A and resources will be shared post-meetup.'),
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
          // Demo: Add a sample meetup
          Provider.of<MeetupService>(context, listen: false).addMeetup(
            Meetup(
              id: 'm1',
              title: 'Monthly Yoga Meetup',
              date: DateTime.now().add(const Duration(days: 3)),
              description: 'Group yoga and expert guest session.',
              registeredUsers: [],
            ),
          );
        },
        tooltip: 'Add Demo Meetup',
        child: const Icon(Icons.add),
      ),
    );
  }
}

extension DateHelpers on DateTime {
  String toShortDateString() => '$day/$month/$year';
}
