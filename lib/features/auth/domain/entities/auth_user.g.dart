// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUserImpl _$$AuthUserImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      isTrainer: json['isTrainer'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AuthUserImplToJson(_$AuthUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'profileImageUrl': instance.profileImageUrl,
      'isTrainer': instance.isTrainer,
      'createdAt': instance.createdAt.toIso8601String(),
    };
