import 'package:flutter/material.dart';
import '../models/progress.dart';

class ProgressService extends ChangeNotifier {
  List<Progress> _progressList = [];

  List<Progress> get progressList => _progressList;

  void setProgressList(List<Progress> list) {
    _progressList = list;
    notifyListeners();
  }

  void addProgress(Progress progress) {
    _progressList.add(progress);
    notifyListeners();
  }
} 