import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  UserProvider() {
    // Initialize with demo user data
    _user = User(
      id: 'demo_user',
      name: 'John Doe',
      email: 'john.doe@example.com',
      age: 28,
      weight: 75.5,
      goals: ['Flexibility', 'Strength', 'Mental Wellness'],
      avatarUrl: null,
    );
  }

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
} 