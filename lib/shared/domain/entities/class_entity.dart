import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_entity.freezed.dart';
part 'class_entity.g.dart';

enum ClassType { group, personal }
enum ClassLevel { beginner, intermediate, advanced }
enum ClassStatus { scheduled, active, completed, cancelled }

@freezed
class ClassEntity with _$ClassEntity {
  const factory ClassEntity({
    required String id,
    required String trainerId,
    required String title,
    required String description,
    required ClassType type,
    required ClassLevel level,
    required DateTime startTime,
    required DateTime endTime,
    required int maxParticipants,
    required double price,
    int? currentParticipants,
    required ClassStatus status,
    String? imageUrl,
    List<String>? tags,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ClassEntity;

  factory ClassEntity.fromJson(Map<String, dynamic> json) => _$ClassEntityFromJson(json);
} 