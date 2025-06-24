import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    required String id,
    required String email,
    required String fullName,
    String? profileImageUrl,
    String? phoneNumber,
    int? age,
    double? weight,
    double? height,
    String? fitnessGoal,
    List<String>? medicalConditions,
    String? emergencyContact,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
} 