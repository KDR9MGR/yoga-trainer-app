class Trainer {
  final String id;
  final String name;
  final List<String> specializations;
  final int experience; // in years
  final double rating;
  final String imageUrl;
  final String? introVideoUrl;
  final List<String> schedule; // e.g., ["Mon 10am", "Wed 2pm"]
  final double pricing;

  Trainer({
    required this.id,
    required this.name,
    required this.specializations,
    required this.experience,
    required this.rating,
    required this.imageUrl,
    this.introVideoUrl,
    required this.schedule,
    required this.pricing,
  });
} 