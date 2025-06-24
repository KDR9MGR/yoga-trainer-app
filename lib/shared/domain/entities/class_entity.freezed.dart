// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClassEntity _$ClassEntityFromJson(Map<String, dynamic> json) {
  return _ClassEntity.fromJson(json);
}

/// @nodoc
mixin _$ClassEntity {
  String get id => throw _privateConstructorUsedError;
  String get trainerId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ClassType get type => throw _privateConstructorUsedError;
  ClassLevel get level => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get maxParticipants => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int? get currentParticipants => throw _privateConstructorUsedError;
  ClassStatus get status => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ClassEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassEntityCopyWith<ClassEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassEntityCopyWith<$Res> {
  factory $ClassEntityCopyWith(
    ClassEntity value,
    $Res Function(ClassEntity) then,
  ) = _$ClassEntityCopyWithImpl<$Res, ClassEntity>;
  @useResult
  $Res call({
    String id,
    String trainerId,
    String title,
    String description,
    ClassType type,
    ClassLevel level,
    DateTime startTime,
    DateTime endTime,
    int maxParticipants,
    double price,
    int? currentParticipants,
    ClassStatus status,
    String? imageUrl,
    List<String>? tags,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ClassEntityCopyWithImpl<$Res, $Val extends ClassEntity>
    implements $ClassEntityCopyWith<$Res> {
  _$ClassEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trainerId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? level = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxParticipants = null,
    Object? price = null,
    Object? currentParticipants = freezed,
    Object? status = null,
    Object? imageUrl = freezed,
    Object? tags = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            trainerId:
                null == trainerId
                    ? _value.trainerId
                    : trainerId // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as ClassType,
            level:
                null == level
                    ? _value.level
                    : level // ignore: cast_nullable_to_non_nullable
                        as ClassLevel,
            startTime:
                null == startTime
                    ? _value.startTime
                    : startTime // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            endTime:
                null == endTime
                    ? _value.endTime
                    : endTime // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            maxParticipants:
                null == maxParticipants
                    ? _value.maxParticipants
                    : maxParticipants // ignore: cast_nullable_to_non_nullable
                        as int,
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as double,
            currentParticipants:
                freezed == currentParticipants
                    ? _value.currentParticipants
                    : currentParticipants // ignore: cast_nullable_to_non_nullable
                        as int?,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as ClassStatus,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            tags:
                freezed == tags
                    ? _value.tags
                    : tags // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClassEntityImplCopyWith<$Res>
    implements $ClassEntityCopyWith<$Res> {
  factory _$$ClassEntityImplCopyWith(
    _$ClassEntityImpl value,
    $Res Function(_$ClassEntityImpl) then,
  ) = __$$ClassEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String trainerId,
    String title,
    String description,
    ClassType type,
    ClassLevel level,
    DateTime startTime,
    DateTime endTime,
    int maxParticipants,
    double price,
    int? currentParticipants,
    ClassStatus status,
    String? imageUrl,
    List<String>? tags,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ClassEntityImplCopyWithImpl<$Res>
    extends _$ClassEntityCopyWithImpl<$Res, _$ClassEntityImpl>
    implements _$$ClassEntityImplCopyWith<$Res> {
  __$$ClassEntityImplCopyWithImpl(
    _$ClassEntityImpl _value,
    $Res Function(_$ClassEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClassEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trainerId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? level = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? maxParticipants = null,
    Object? price = null,
    Object? currentParticipants = freezed,
    Object? status = null,
    Object? imageUrl = freezed,
    Object? tags = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ClassEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        trainerId:
            null == trainerId
                ? _value.trainerId
                : trainerId // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as ClassType,
        level:
            null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                    as ClassLevel,
        startTime:
            null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        endTime:
            null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        maxParticipants:
            null == maxParticipants
                ? _value.maxParticipants
                : maxParticipants // ignore: cast_nullable_to_non_nullable
                    as int,
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as double,
        currentParticipants:
            freezed == currentParticipants
                ? _value.currentParticipants
                : currentParticipants // ignore: cast_nullable_to_non_nullable
                    as int?,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as ClassStatus,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        tags:
            freezed == tags
                ? _value._tags
                : tags // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassEntityImpl implements _ClassEntity {
  const _$ClassEntityImpl({
    required this.id,
    required this.trainerId,
    required this.title,
    required this.description,
    required this.type,
    required this.level,
    required this.startTime,
    required this.endTime,
    required this.maxParticipants,
    required this.price,
    this.currentParticipants,
    required this.status,
    this.imageUrl,
    final List<String>? tags,
    required this.createdAt,
    this.updatedAt,
  }) : _tags = tags;

  factory _$ClassEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String trainerId;
  @override
  final String title;
  @override
  final String description;
  @override
  final ClassType type;
  @override
  final ClassLevel level;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int maxParticipants;
  @override
  final double price;
  @override
  final int? currentParticipants;
  @override
  final ClassStatus status;
  @override
  final String? imageUrl;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ClassEntity(id: $id, trainerId: $trainerId, title: $title, description: $description, type: $type, level: $level, startTime: $startTime, endTime: $endTime, maxParticipants: $maxParticipants, price: $price, currentParticipants: $currentParticipants, status: $status, imageUrl: $imageUrl, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trainerId, trainerId) ||
                other.trainerId == trainerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currentParticipants, currentParticipants) ||
                other.currentParticipants == currentParticipants) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    trainerId,
    title,
    description,
    type,
    level,
    startTime,
    endTime,
    maxParticipants,
    price,
    currentParticipants,
    status,
    imageUrl,
    const DeepCollectionEquality().hash(_tags),
    createdAt,
    updatedAt,
  );

  /// Create a copy of ClassEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassEntityImplCopyWith<_$ClassEntityImpl> get copyWith =>
      __$$ClassEntityImplCopyWithImpl<_$ClassEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassEntityImplToJson(this);
  }
}

abstract class _ClassEntity implements ClassEntity {
  const factory _ClassEntity({
    required final String id,
    required final String trainerId,
    required final String title,
    required final String description,
    required final ClassType type,
    required final ClassLevel level,
    required final DateTime startTime,
    required final DateTime endTime,
    required final int maxParticipants,
    required final double price,
    final int? currentParticipants,
    required final ClassStatus status,
    final String? imageUrl,
    final List<String>? tags,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$ClassEntityImpl;

  factory _ClassEntity.fromJson(Map<String, dynamic> json) =
      _$ClassEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get trainerId;
  @override
  String get title;
  @override
  String get description;
  @override
  ClassType get type;
  @override
  ClassLevel get level;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get maxParticipants;
  @override
  double get price;
  @override
  int? get currentParticipants;
  @override
  ClassStatus get status;
  @override
  String? get imageUrl;
  @override
  List<String>? get tags;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ClassEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassEntityImplCopyWith<_$ClassEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
