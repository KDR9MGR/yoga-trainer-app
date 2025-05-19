class Habit {
  final String userId;
  final String habitName;
  final String frequency; // daily, weekly
  final List<DateTime> completedDates;

  Habit({
    required this.userId,
    required this.habitName,
    required this.frequency,
    required this.completedDates,
  });
} 