class DietPlan {
  final String id;
  final String userId;
  final String planType; // weekly, monthly
  final DateTime startDate;
  final DateTime endDate;
  final List<String> meals;
  final String? downloadableUrl;

  DietPlan({
    required this.id,
    required this.userId,
    required this.planType,
    required this.startDate,
    required this.endDate,
    required this.meals,
    this.downloadableUrl,
  });
} 