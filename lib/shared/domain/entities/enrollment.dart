import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment.freezed.dart';
part 'enrollment.g.dart';

enum EnrollmentStatus { pending, confirmed, cancelled, completed }

@freezed
class Enrollment with _$Enrollment {
  const factory Enrollment({
    required String id,
    required String studentId,
    required String classId,
    required EnrollmentStatus status,
    required DateTime enrolledAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    bool? attended,
    double? rating,
    String? feedback,
  }) = _Enrollment;

  factory Enrollment.fromJson(Map<String, dynamic> json) => _$EnrollmentFromJson(json);
} 