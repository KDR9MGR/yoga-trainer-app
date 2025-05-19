import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/notification_service.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<NotificationService>(context).notifications;
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: notifications.isEmpty
          ? const Center(child: Text('No notifications yet.'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(notifications[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Demo: Add a sample notification
          Provider.of<NotificationService>(context, listen: false).addNotification('Class reminder at ${DateTime.now().hour}:${DateTime.now().minute}');
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Demo Notification',
      ),
    );
  }
}
