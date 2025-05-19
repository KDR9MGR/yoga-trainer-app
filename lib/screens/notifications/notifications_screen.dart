import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {
              // TODO: Implement mark all as read
            },
          ),
        ],
      ),
      body: _buildNotificationsList(),
    );
  }

  Widget _buildNotificationsList() {
    final notifications = [
      {
        'type': 'class_reminder',
        'title': 'Upcoming Class',
        'message': 'Your Vinyasa Flow class with Sarah starts in 30 minutes',
        'time': '30m ago',
        'isRead': false,
      },
      {
        'type': 'achievement',
        'title': 'New Achievement',
        'message': 'Congratulations! You\'ve completed 10 classes this month',
        'time': '2h ago',
        'isRead': false,
      },
      {
        'type': 'meetup',
        'title': 'New Meetup',
        'message': 'Morning Flow in the Park has been scheduled for tomorrow',
        'time': '5h ago',
        'isRead': true,
      },
      {
        'type': 'trainer_message',
        'title': 'Message from Trainer',
        'message': 'Great progress in today\'s session! Keep it up!',
        'time': '1d ago',
        'isRead': true,
      },
      {
        'type': 'diet_reminder',
        'title': 'Diet Plan Update',
        'message': 'Your weekly meal plan has been updated',
        'time': '2d ago',
        'isRead': true,
      },
    ];

    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No notifications',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationTile(notification);
      },
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> notification) {
    IconData icon;
    Color iconColor;

    switch (notification['type']) {
      case 'class_reminder':
        icon = Icons.event;
        iconColor = Colors.blue;
        break;
      case 'achievement':
        icon = Icons.emoji_events;
        iconColor = Colors.amber;
        break;
      case 'meetup':
        icon = Icons.group;
        iconColor = Colors.green;
        break;
      case 'trainer_message':
        icon = Icons.message;
        iconColor = AppTheme.primaryColor;
        break;
      case 'diet_reminder':
        icon = Icons.restaurant_menu;
        iconColor = Colors.orange;
        break;
      default:
        icon = Icons.notifications;
        iconColor = Colors.grey;
    }

    return Dismissible(
      key: Key(notification['title']),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // TODO: Implement delete notification
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(
          notification['title'] as String,
          style: TextStyle(
            fontWeight:
                notification['isRead'] as bool ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(notification['message'] as String),
            const SizedBox(height: 4),
            Text(
              notification['time'] as String,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // TODO: Implement notification tap
        },
      ),
    );
  }
} 