// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

/// @nodoc
mixin _$Student {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  String? get fitnessGoal => throw _privateConstructorUsedError;
  List<String>? get medicalConditions => throw _privateConstructorUsedError;
  String? get emergencyContact => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Student to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res, Student>;
  @useResult
  $Res call({
    String id,
    String email,
    String fullName,
    String? profileImageUrl,
    String? phoneNumber,
    int? age,
    double? weight,
    double? height,
    String? fitnessGoal,
    List<String>? medicalConditions,
    String? emergencyContact,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$StudentCopyWithImpl<$Res, $Val extends Student>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? profileImageUrl = freezed,
    Object? phoneNumber = freezed,
    Object? age = freezed,
    Object? weight = freezed,
    Object? height = freezed,
    Object? fitnessGoal = freezed,
    Object? medicalConditions = freezed,
    Object? emergencyContact = freezed,
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
            phoneNumber:
                freezed == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            age:
                freezed == age
                    ? _value.age
                    : age // ignore: cast_nullable_to_non_nullable
                        as int?,
            weight:
                freezed == weight
                    ? _value.weight
                    : weight // ignore: cast_nullable_to_non_nullable
                        as double?,
            height:
                freezed == height
                    ? _value.height
                    : height // ignore: cast_nullable_to_non_nullable
                        as double?,
            fitnessGoal:
                freezed == fitnessGoal
                    ? _value.fitnessGoal
                    : fitnessGoal // ignore: cast_nullable_to_non_nullable
                        as String?,
            medicalConditions:
                freezed == medicalConditions
                    ? _value.medicalConditions
                    : medicalConditions // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            emergencyContact:
                freezed == emergencyContact
                    ? _value.emergencyContact
                    : emergencyContact // ignore: cast_nullable_to_non_nullable
                        as String?,
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
abstract class _$$StudentImplCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$StudentImplCopyWith(
    _$StudentImpl value,
    $Res Function(_$StudentImpl) then,
  ) = __$$StudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String fullName,
    String? profileImageUrl,
    String? phoneNumber,
    int? age,
    double? weight,
    double? height,
    String? fitnessGoal,
    List<String>? medicalConditions,
    String? emergencyContact,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$StudentImplCopyWithImpl<$Res>
    extends _$StudentCopyWithImpl<$Res, _$StudentImpl>
    implements _$$StudentImplCopyWith<$Res> {
  __$$StudentImplCopyWithImpl(
    _$StudentImpl _value,
    $Res Function(_$StudentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? profileImageUrl = freezed,
    Object? phoneNumber = freezed,
    Object? age = freezed,
    Object? weight = freezed,
    Object? height = freezed,
    Object? fitnessGoal = freezed,
    Object? medicalConditions = freezed,
    Object? emergencyContact = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$StudentImpl(
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
        phoneNumber:
            freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        age:
            freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                    as int?,
        weight:
            freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                    as double?,
        height:
            freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                    as double?,
        fitnessGoal:
            freezed == fitnessGoal
                ? _value.fitnessGoal
                : fitnessGoal // ignore: cast_nullable_to_non_nullable
                    as String?,
        medicalConditions:
            freezed == medicalConditions
                ? _value._medicalConditions
                : medicalConditions // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        emergencyContact:
            freezed == emergencyContact
                ? _value.emergencyContact
                : emergencyContact // ignore: cast_nullable_to_non_nullable
                    as String?,
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
class _$StudentImpl implements _Student {
  const _$StudentImpl({
    required this.id,
    required this.email,
    required this.fullName,
    this.profileImageUrl,
    this.phoneNumber,
    this.age,
    this.weight,
    this.height,
    this.fitnessGoal,
    final List<String>? medicalConditions,
    this.emergencyContact,
    required this.createdAt,
    this.updatedAt,
  }) : _medicalConditions = medicalConditions;

  factory _$StudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String? profileImageUrl;
  @override
  final String? phoneNumber;
  @override
  final int? age;
  @override
  final double? weight;
  @override
  final double? height;
  @override
  final String? fitnessGoal;
  final List<String>? _medicalConditions;
  @override
  List<String>? get medicalConditions {
    final value = _medicalConditions;
    if (value == null) return null;
    if (_medicalConditions is EqualUnmodifiableListView)
      return _medicalConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? emergencyContact;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Student(id: $id, email: $email, fullName: $fullName, profileImageUrl: $profileImageUrl, phoneNumber: $phoneNumber, age: $age, weight: $weight, height: $height, fitnessGoal: $fitnessGoal, medicalConditions: $medicalConditions, emergencyContact: $emergencyContact, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.fitnessGoal, fitnessGoal) ||
                other.fitnessGoal == fitnessGoal) &&
            const DeepCollectionEquality().equals(
              other._medicalConditions,
              _medicalConditions,
            ) &&
            (identical(other.emergencyContact, emergencyContact) ||
                other.emergencyContact == emergencyContact) &&
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
    phoneNumber,
    age,
    weight,
    height,
    fitnessGoal,
    const DeepCollectionEquality().hash(_medicalConditions),
    emergencyContact,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      __$$StudentImplCopyWithImpl<_$StudentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentImplToJson(this);
  }
}

abstract class _Student implements Student {
  const factory _Student({
    required final String id,
    required final String email,
    required final String fullName,
    final String? profileImageUrl,
    final String? phoneNumber,
    final int? age,
    final double? weight,
    final double? height,
    final String? fitnessGoal,
    final List<String>? medicalConditions,
    final String? emergencyContact,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$StudentImpl;

  factory _Student.fromJson(Map<String, dynamic> json) = _$StudentImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  @override
  String? get profileImageUrl;
  @override
  String? get phoneNumber;
  @override
  int? get age;
  @override
  double? get weight;
  @override
  double? get height;
  @override
  String? get fitnessGoal;
  @override
  List<String>? get medicalConditions;
  @override
  String? get emergencyContact;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
