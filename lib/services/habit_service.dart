import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitService extends ChangeNotifier {
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  void setHabits(List<Habit> habits) {
    _habits = habits;
    notifyListeners();
  }

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }
} 