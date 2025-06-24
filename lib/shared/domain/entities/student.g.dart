// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      age: (json['age'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      fitnessGoal: json['fitnessGoal'] as String?,
      medicalConditions:
          (json['medicalConditions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      emergencyContact: json['emergencyContact'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'profileImageUrl': instance.profileImageUrl,
      'phoneNumber': instance.phoneNumber,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'fitnessGoal': instance.fitnessGoal,
      'medicalConditions': instance.medicalConditions,
      'emergencyContact': instance.emergencyContact,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
