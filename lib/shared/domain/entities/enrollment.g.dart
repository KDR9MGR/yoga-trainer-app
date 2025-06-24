// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnrollmentImpl _$$EnrollmentImplFromJson(Map<String, dynamic> json) =>
    _$EnrollmentImpl(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      classId: json['classId'] as String,
      status: $enumDecode(_$EnrollmentStatusEnumMap, json['status']),
      enrolledAt: DateTime.parse(json['enrolledAt'] as String),
      cancelledAt:
          json['cancelledAt'] == null
              ? null
              : DateTime.parse(json['cancelledAt'] as String),
      cancellationReason: json['cancellationReason'] as String?,
      attended: json['attended'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
    );

Map<String, dynamic> _$$EnrollmentImplToJson(_$EnrollmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'classId': instance.classId,
      'status': _$EnrollmentStatusEnumMap[instance.status]!,
      'enrolledAt': instance.enrolledAt.toIso8601String(),
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'cancellationReason': instance.cancellationReason,
      'attended': instance.attended,
      'rating': instance.rating,
      'feedback': instance.feedback,
    };

const _$EnrollmentStatusEnumMap = {
  EnrollmentStatus.pending: 'pending',
  EnrollmentStatus.confirmed: 'confirmed',
  EnrollmentStatus.cancelled: 'cancelled',
  EnrollmentStatus.completed: 'completed',
};
