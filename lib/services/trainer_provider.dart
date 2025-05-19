import 'package:flutter/material.dart';
import '../models/trainer.dart';

class TrainerProvider extends ChangeNotifier {
  List<Trainer> _trainers = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Trainer> get trainers => _trainers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Initialize with sample data for development
  TrainerProvider() {
    _initializeSampleData();
  }

  void _initializeSampleData() {
    _trainers = [
      Trainer(
        id: 't1',
        name: 'Sarah Johnson',
        specializations: ['Hatha', 'Vinyasa'],
        experience: 8,
        rating: 4.9,
        imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        schedule: ['Mon 10am', 'Wed 2pm', 'Fri 4pm'],
        pricing: 45.0,
      ),
      Trainer(
        id: 't2',
        name: 'Michael Chen',
        specializations: ['Ashtanga', 'Power Yoga'],
        experience: 12,
        rating: 4.8,
        imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        schedule: ['Tue 9am', 'Thu 3pm', 'Sat 11am'],
        pricing: 55.0,
      ),
      Trainer(
        id: 't3',
        name: 'Emma Wilson',
        specializations: ['Yin', 'Prenatal'],
        experience: 6,
        rating: 4.7,
        imageUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
        schedule: ['Mon 2pm', 'Wed 10am', 'Fri 1pm'],
        pricing: 40.0,
      ),
      Trainer(
        id: 't4',
        name: 'David Kumar',
        specializations: ['Vinyasa', 'Power Yoga'],
        experience: 10,
        rating: 4.9,
        imageUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
        schedule: ['Tue 4pm', 'Thu 11am', 'Sat 9am'],
        pricing: 50.0,
      ),
    ];
    notifyListeners();
  }

  // CRUD Operations
  void setTrainers(List<Trainer> trainers) {
    _trainers = trainers;
    notifyListeners();
  }

  void addTrainer(Trainer trainer) {
    _trainers.add(trainer);
    notifyListeners();
  }

  void updateTrainer(Trainer updatedTrainer) {
    final index = _trainers.indexWhere((t) => t.id == updatedTrainer.id);
    if (index != -1) {
      _trainers[index] = updatedTrainer;
      notifyListeners();
    }
  }

  void removeTrainer(String trainerId) {
    _trainers.removeWhere((t) => t.id == trainerId);
    notifyListeners();
  }

  // Filter and Search Operations
  List<Trainer> getTrainersBySpecialization(String specialization) {
    return _trainers.where((t) => 
      t.specializations.contains(specialization)
    ).toList();
  }

  List<Trainer> searchTrainers(String query) {
    return _trainers.where((t) => 
      t.name.toLowerCase().contains(query.toLowerCase()) ||
      t.specializations.any((s) => s.toLowerCase().contains(query.toLowerCase()))
    ).toList();
  }

  // Sorting Operations
  void sortByRating() {
    _trainers.sort((a, b) => b.rating.compareTo(a.rating));
    notifyListeners();
  }

  void sortByExperience() {
    _trainers.sort((a, b) => b.experience.compareTo(a.experience));
    notifyListeners();
  }

  void sortByPrice() {
    _trainers.sort((a, b) => a.pricing.compareTo(b.pricing));
    notifyListeners();
  }

  // Loading and Error Handling
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Future API Integration
  Future<void> fetchTrainers() async {
    setLoading(true);
    setError(null);
    
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      // For now, just use sample data
      _initializeSampleData();
    } catch (e) {
      setError('Failed to fetch trainers: $e');
    } finally {
      setLoading(false);
    }
  }
} 