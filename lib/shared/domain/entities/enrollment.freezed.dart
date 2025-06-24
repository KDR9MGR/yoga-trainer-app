// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Enrollment _$EnrollmentFromJson(Map<String, dynamic> json) {
  return _Enrollment.fromJson(json);
}

/// @nodoc
mixin _$Enrollment {
  String get id => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String get classId => throw _privateConstructorUsedError;
  EnrollmentStatus get status => throw _privateConstructorUsedError;
  DateTime get enrolledAt => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  bool? get attended => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;

  /// Serializes this Enrollment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Enrollment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentCopyWith<Enrollment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentCopyWith<$Res> {
  factory $EnrollmentCopyWith(
    Enrollment value,
    $Res Function(Enrollment) then,
  ) = _$EnrollmentCopyWithImpl<$Res, Enrollment>;
  @useResult
  $Res call({
    String id,
    String studentId,
    String classId,
    EnrollmentStatus status,
    DateTime enrolledAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    bool? attended,
    double? rating,
    String? feedback,
  });
}

/// @nodoc
class _$EnrollmentCopyWithImpl<$Res, $Val extends Enrollment>
    implements $EnrollmentCopyWith<$Res> {
  _$EnrollmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Enrollment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? classId = null,
    Object? status = null,
    Object? enrolledAt = null,
    Object? cancelledAt = freezed,
    Object? cancellationReason = freezed,
    Object? attended = freezed,
    Object? rating = freezed,
    Object? feedback = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            studentId:
                null == studentId
                    ? _value.studentId
                    : studentId // ignore: cast_nullable_to_non_nullable
                        as String,
            classId:
                null == classId
                    ? _value.classId
                    : classId // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as EnrollmentStatus,
            enrolledAt:
                null == enrolledAt
                    ? _value.enrolledAt
                    : enrolledAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            cancelledAt:
                freezed == cancelledAt
                    ? _value.cancelledAt
                    : cancelledAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            cancellationReason:
                freezed == cancellationReason
                    ? _value.cancellationReason
                    : cancellationReason // ignore: cast_nullable_to_non_nullable
                        as String?,
            attended:
                freezed == attended
                    ? _value.attended
                    : attended // ignore: cast_nullable_to_non_nullable
                        as bool?,
            rating:
                freezed == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double?,
            feedback:
                freezed == feedback
                    ? _value.feedback
                    : feedback // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EnrollmentImplCopyWith<$Res>
    implements $EnrollmentCopyWith<$Res> {
  factory _$$EnrollmentImplCopyWith(
    _$EnrollmentImpl value,
    $Res Function(_$EnrollmentImpl) then,
  ) = __$$EnrollmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String studentId,
    String classId,
    EnrollmentStatus status,
    DateTime enrolledAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    bool? attended,
    double? rating,
    String? feedback,
  });
}

/// @nodoc
class __$$EnrollmentImplCopyWithImpl<$Res>
    extends _$EnrollmentCopyWithImpl<$Res, _$EnrollmentImpl>
    implements _$$EnrollmentImplCopyWith<$Res> {
  __$$EnrollmentImplCopyWithImpl(
    _$EnrollmentImpl _value,
    $Res Function(_$EnrollmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Enrollment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? classId = null,
    Object? status = null,
    Object? enrolledAt = null,
    Object? cancelledAt = freezed,
    Object? cancellationReason = freezed,
    Object? attended = freezed,
    Object? rating = freezed,
    Object? feedback = freezed,
  }) {
    return _then(
      _$EnrollmentImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        studentId:
            null == studentId
                ? _value.studentId
                : studentId // ignore: cast_nullable_to_non_nullable
                    as String,
        classId:
            null == classId
                ? _value.classId
                : classId // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as EnrollmentStatus,
        enrolledAt:
            null == enrolledAt
                ? _value.enrolledAt
                : enrolledAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        cancelledAt:
            freezed == cancelledAt
                ? _value.cancelledAt
                : cancelledAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        cancellationReason:
            freezed == cancellationReason
                ? _value.cancellationReason
                : cancellationReason // ignore: cast_nullable_to_non_nullable
                    as String?,
        attended:
            freezed == attended
                ? _value.attended
                : attended // ignore: cast_nullable_to_non_nullable
                    as bool?,
        rating:
            freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double?,
        feedback:
            freezed == feedback
                ? _value.feedback
                : feedback // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollmentImpl implements _Enrollment {
  const _$EnrollmentImpl({
    required this.id,
    required this.studentId,
    required this.classId,
    required this.status,
    required this.enrolledAt,
    this.cancelledAt,
    this.cancellationReason,
    this.attended,
    this.rating,
    this.feedback,
  });

  factory _$EnrollmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentImplFromJson(json);

  @override
  final String id;
  @override
  final String studentId;
  @override
  final String classId;
  @override
  final EnrollmentStatus status;
  @override
  final DateTime enrolledAt;
  @override
  final DateTime? cancelledAt;
  @override
  final String? cancellationReason;
  @override
  final bool? attended;
  @override
  final double? rating;
  @override
  final String? feedback;

  @override
  String toString() {
    return 'Enrollment(id: $id, studentId: $studentId, classId: $classId, status: $status, enrolledAt: $enrolledAt, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, attended: $attended, rating: $rating, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.attended, attended) ||
                other.attended == attended) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    studentId,
    classId,
    status,
    enrolledAt,
    cancelledAt,
    cancellationReason,
    attended,
    rating,
    feedback,
  );

  /// Create a copy of Enrollment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentImplCopyWith<_$EnrollmentImpl> get copyWith =>
      __$$EnrollmentImplCopyWithImpl<_$EnrollmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollmentImplToJson(this);
  }
}

abstract class _Enrollment implements Enrollment {
  const factory _Enrollment({
    required final String id,
    required final String studentId,
    required final String classId,
    required final EnrollmentStatus status,
    required final DateTime enrolledAt,
    final DateTime? cancelledAt,
    final String? cancellationReason,
    final bool? attended,
    final double? rating,
    final String? feedback,
  }) = _$EnrollmentImpl;

  factory _Enrollment.fromJson(Map<String, dynamic> json) =
      _$EnrollmentImpl.fromJson;

  @override
  String get id;
  @override
  String get studentId;
  @override
  String get classId;
  @override
  EnrollmentStatus get status;
  @override
  DateTime get enrolledAt;
  @override
  DateTime? get cancelledAt;
  @override
  String? get cancellationReason;
  @override
  bool? get attended;
  @override
  double? get rating;
  @override
  String? get feedback;

  /// Create a copy of Enrollment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentImplCopyWith<_$EnrollmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
