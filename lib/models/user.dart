class User {
  final String id;
  final String name;
  final String email;
  final int age;
  final double weight;
  final List<String> goals;
  final String? avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.weight,
    required this.goals,
    this.avatarUrl,
  });
} 