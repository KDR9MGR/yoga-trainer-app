// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainerImpl _$$TrainerImplFromJson(Map<String, dynamic> json) =>
    _$TrainerImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      bio: json['bio'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      specializations:
          (json['specializations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      totalClasses: (json['totalClasses'] as num?)?.toInt(),
      totalStudents: (json['totalStudents'] as num?)?.toInt(),
      monthlyEarnings: (json['monthlyEarnings'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TrainerImplToJson(_$TrainerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'profileImageUrl': instance.profileImageUrl,
      'bio': instance.bio,
      'phoneNumber': instance.phoneNumber,
      'specializations': instance.specializations,
      'rating': instance.rating,
      'totalClasses': instance.totalClasses,
      'totalStudents': instance.totalStudents,
      'monthlyEarnings': instance.monthlyEarnings,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
