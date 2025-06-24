// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassEntityImpl _$$ClassEntityImplFromJson(Map<String, dynamic> json) =>
    _$ClassEntityImpl(
      id: json['id'] as String,
      trainerId: json['trainerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ClassTypeEnumMap, json['type']),
      level: $enumDecode(_$ClassLevelEnumMap, json['level']),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      maxParticipants: (json['maxParticipants'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      currentParticipants: (json['currentParticipants'] as num?)?.toInt(),
      status: $enumDecode(_$ClassStatusEnumMap, json['status']),
      imageUrl: json['imageUrl'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ClassEntityImplToJson(_$ClassEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainerId': instance.trainerId,
      'title': instance.title,
      'description': instance.description,
      'type': _$ClassTypeEnumMap[instance.type]!,
      'level': _$ClassLevelEnumMap[instance.level]!,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'maxParticipants': instance.maxParticipants,
      'price': instance.price,
      'currentParticipants': instance.currentParticipants,
      'status': _$ClassStatusEnumMap[instance.status]!,
      'imageUrl': instance.imageUrl,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ClassTypeEnumMap = {
  ClassType.group: 'group',
  ClassType.personal: 'personal',
};

const _$ClassLevelEnumMap = {
  ClassLevel.beginner: 'beginner',
  ClassLevel.intermediate: 'intermediate',
  ClassLevel.advanced: 'advanced',
};

const _$ClassStatusEnumMap = {
  ClassStatus.scheduled: 'scheduled',
  ClassStatus.active: 'active',
  ClassStatus.completed: 'completed',
  ClassStatus.cancelled: 'cancelled',
};
