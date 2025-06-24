// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Trainer _$TrainerFromJson(Map<String, dynamic> json) {
  return _Trainer.fromJson(json);
}

/// @nodoc
mixin _$Trainer {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  List<String>? get specializations => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get totalClasses => throw _privateConstructorUsedError;
  int? get totalStudents => throw _privateConstructorUsedError;
  double? get monthlyEarnings => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Trainer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainerCopyWith<Trainer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainerCopyWith<$Res> {
  factory $TrainerCopyWith(Trainer value, $Res Function(Trainer) then) =
      _$TrainerCopyWithImpl<$Res, Trainer>;
  @useResult
  $Res call({
    String id,
    String email,
    String fullName,
    String? profileImageUrl,
    String? bio,
    String? phoneNumber,
    List<String>? specializations,
    double? rating,
    int? totalClasses,
    int? totalStudents,
    double? monthlyEarnings,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$TrainerCopyWithImpl<$Res, $Val extends Trainer>
    implements $TrainerCopyWith<$Res> {
  _$TrainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? profileImageUrl = freezed,
    Object? bio = freezed,
    Object? phoneNumber = freezed,
    Object? specializations = freezed,
    Object? rating = freezed,
    Object? totalClasses = freezed,
    Object? totalStudents = freezed,
    Object? monthlyEarnings = freezed,
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
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            fullName:
                null == fullName
                    ? _value.fullName
                    : fullName // ignore: cast_nullable_to_non_nullable
                        as String,
            profileImageUrl:
                freezed == profileImageUrl
                    ? _value.profileImageUrl
                    : profileImageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            bio:
                freezed == bio
                    ? _value.bio
                    : bio // ignore: cast_nullable_to_non_nullable
                        as String?,
            phoneNumber:
                freezed == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            specializations:
                freezed == specializations
                    ? _value.specializations
                    : specializations // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            rating:
                freezed == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double?,
            totalClasses:
                freezed == totalClasses
                    ? _value.totalClasses
                    : totalClasses // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalStudents:
                freezed == totalStudents
                    ? _value.totalStudents
                    : totalStudents // ignore: cast_nullable_to_non_nullable
                        as int?,
            monthlyEarnings:
                freezed == monthlyEarnings
                    ? _value.monthlyEarnings
                    : monthlyEarnings // ignore: cast_nullable_to_non_nullable
                        as double?,
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
abstract class _$$TrainerImplCopyWith<$Res> implements $TrainerCopyWith<$Res> {
  factory _$$TrainerImplCopyWith(
    _$TrainerImpl value,
    $Res Function(_$TrainerImpl) then,
  ) = __$$TrainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String fullName,
    String? profileImageUrl,
    String? bio,
    String? phoneNumber,
    List<String>? specializations,
    double? rating,
    int? totalClasses,
    int? totalStudents,
    double? monthlyEarnings,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$TrainerImplCopyWithImpl<$Res>
    extends _$TrainerCopyWithImpl<$Res, _$TrainerImpl>
    implements _$$TrainerImplCopyWith<$Res> {
  __$$TrainerImplCopyWithImpl(
    _$TrainerImpl _value,
    $Res Function(_$TrainerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? profileImageUrl = freezed,
    Object? bio = freezed,
    Object? phoneNumber = freezed,
    Object? specializations = freezed,
    Object? rating = freezed,
    Object? totalClasses = freezed,
    Object? totalStudents = freezed,
    Object? monthlyEarnings = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$TrainerImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        fullName:
            null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                    as String,
        profileImageUrl:
            freezed == profileImageUrl
                ? _value.profileImageUrl
                : profileImageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        bio:
            freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                    as String?,
        phoneNumber:
            freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        specializations:
            freezed == specializations
                ? _value._specializations
                : specializations // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        rating:
            freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double?,
        totalClasses:
            freezed == totalClasses
                ? _value.totalClasses
                : totalClasses // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalStudents:
            freezed == totalStudents
                ? _value.totalStudents
                : totalStudents // ignore: cast_nullable_to_non_nullable
                    as int?,
        monthlyEarnings:
            freezed == monthlyEarnings
                ? _value.monthlyEarnings
                : monthlyEarnings // ignore: cast_nullable_to_non_nullable
                    as double?,
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
class _$TrainerImpl implements _Trainer {
  const _$TrainerImpl({
    required this.id,
    required this.email,
    required this.fullName,
    this.profileImageUrl,
    this.bio,
    this.phoneNumber,
    final List<String>? specializations,
    this.rating,
    this.totalClasses,
    this.totalStudents,
    this.monthlyEarnings,
    required this.createdAt,
    this.updatedAt,
  }) : _specializations = specializations;

  factory _$TrainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainerImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String? profileImageUrl;
  @override
  final String? bio;
  @override
  final String? phoneNumber;
  final List<String>? _specializations;
  @override
  List<String>? get specializations {
    final value = _specializations;
    if (value == null) return null;
    if (_specializations is EqualUnmodifiableListView) return _specializations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? rating;
  @override
  final int? totalClasses;
  @override
  final int? totalStudents;
  @override
  final double? monthlyEarnings;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Trainer(id: $id, email: $email, fullName: $fullName, profileImageUrl: $profileImageUrl, bio: $bio, phoneNumber: $phoneNumber, specializations: $specializations, rating: $rating, totalClasses: $totalClasses, totalStudents: $totalStudents, monthlyEarnings: $monthlyEarnings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality().equals(
              other._specializations,
              _specializations,
            ) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalClasses, totalClasses) ||
                other.totalClasses == totalClasses) &&
            (identical(other.totalStudents, totalStudents) ||
                other.totalStudents == totalStudents) &&
            (identical(other.monthlyEarnings, monthlyEarnings) ||
                other.monthlyEarnings == monthlyEarnings) &&
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
    email,
    fullName,
    profileImageUrl,
    bio,
    phoneNumber,
    const DeepCollectionEquality().hash(_specializations),
    rating,
    totalClasses,
    totalStudents,
    monthlyEarnings,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainerImplCopyWith<_$TrainerImpl> get copyWith =>
      __$$TrainerImplCopyWithImpl<_$TrainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainerImplToJson(this);
  }
}

abstract class _Trainer implements Trainer {
  const factory _Trainer({
    required final String id,
    required final String email,
    required final String fullName,
    final String? profileImageUrl,
    final String? bio,
    final String? phoneNumber,
    final List<String>? specializations,
    final double? rating,
    final int? totalClasses,
    final int? totalStudents,
    final double? monthlyEarnings,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$TrainerImpl;

  factory _Trainer.fromJson(Map<String, dynamic> json) = _$TrainerImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  @override
  String? get profileImageUrl;
  @override
  String? get bio;
  @override
  String? get phoneNumber;
  @override
  List<String>? get specializations;
  @override
  double? get rating;
  @override
  int? get totalClasses;
  @override
  int? get totalStudents;
  @override
  double? get monthlyEarnings;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Trainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainerImplCopyWith<_$TrainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
