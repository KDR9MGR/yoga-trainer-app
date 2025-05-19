class Progress {
  final String userId;
  final DateTime date;
  final bool attended;
  final String mood;
  final double weight;
  final double bmi;

  Progress({
    required this.userId,
    required this.date,
    required this.attended,
    required this.mood,
    required this.weight,
    required this.bmi,
  });
} 