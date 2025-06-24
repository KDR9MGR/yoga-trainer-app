import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer.freezed.dart';
part 'trainer.g.dart';

@freezed
class Trainer with _$Trainer {
  const factory Trainer({
    required String id,
    required String email,
    required String fullName,
    String? profileImageUrl,
    String? bio,
    String? phoneNumber,
    List<String>? specializations,
    double? rating,
    int? totalClasses,
    int? totalStudents,
    double? monthlyEarnings,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Trainer;

  factory Trainer.fromJson(Map<String, dynamic> json) => _$TrainerFromJson(json);
} 