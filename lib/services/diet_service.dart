import 'package:flutter/material.dart';
import '../models/diet_plan.dart';

class DietService extends ChangeNotifier {
  List<DietPlan> _plans = [];

  List<DietPlan> get plans => _plans;

  void setPlans(List<DietPlan> plans) {
    _plans = plans;
    notifyListeners();
  }

  void addPlan(DietPlan plan) {
    _plans.add(plan);
    notifyListeners();
  }
} 