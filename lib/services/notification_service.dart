import 'package:flutter/material.dart';

class NotificationService extends ChangeNotifier {
  List<String> _notifications = [];

  List<String> get notifications => _notifications;

  void addNotification(String notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }
} 