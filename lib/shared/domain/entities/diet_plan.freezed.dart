// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DietPlan _$DietPlanFromJson(Map<String, dynamic> json) {
  return _DietPlan.fromJson(json);
}

/// @nodoc
mixin _$DietPlan {
  String get id => throw _privateConstructorUsedError;
  String get trainerId => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get goal =>
      throw _privateConstructorUsedError; // weight loss, muscle gain, maintenance
  int get dailyCalories => throw _privateConstructorUsedError;
  Map<String, dynamic> get macros =>
      throw _privateConstructorUsedError; // protein, carbs, fats percentages
  List<DietMealPlan> get mealPlans => throw _privateConstructorUsedError;
  List<String>? get restrictions =>
      throw _privateConstructorUsedError; // dietary restrictions
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DietPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DietPlanCopyWith<DietPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietPlanCopyWith<$Res> {
  factory $DietPlanCopyWith(DietPlan value, $Res Function(DietPlan) then) =
      _$DietPlanCopyWithImpl<$Res, DietPlan>;
  @useResult
  $Res call({
    String id,
    String trainerId,
    String clientId,
    String title,
    String description,
    String goal,
    int dailyCalories,
    Map<String, dynamic> macros,
    List<DietMealPlan> mealPlans,
    List<String>? restrictions,
    String? notes,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$DietPlanCopyWithImpl<$Res, $Val extends DietPlan>
    implements $DietPlanCopyWith<$Res> {
  _$DietPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trainerId = null,
    Object? clientId = null,
    Object? title = null,
    Object? description = null,
    Object? goal = null,
    Object? dailyCalories = null,
    Object? macros = null,
    Object? mealPlans = null,
    Object? restrictions = freezed,
    Object? notes = freezed,
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
            clientId:
                null == clientId
                    ? _value.clientId
                    : clientId // ignore: cast_nullable_to_non_nullable
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
            goal:
                null == goal
                    ? _value.goal
                    : goal // ignore: cast_nullable_to_non_nullable
                        as String,
            dailyCalories:
                null == dailyCalories
                    ? _value.dailyCalories
                    : dailyCalories // ignore: cast_nullable_to_non_nullable
                        as int,
            macros:
                null == macros
                    ? _value.macros
                    : macros // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            mealPlans:
                null == mealPlans
                    ? _value.mealPlans
                    : mealPlans // ignore: cast_nullable_to_non_nullable
                        as List<DietMealPlan>,
            restrictions:
                freezed == restrictions
                    ? _value.restrictions
                    : restrictions // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DietPlanImplCopyWith<$Res>
    implements $DietPlanCopyWith<$Res> {
  factory _$$DietPlanImplCopyWith(
    _$DietPlanImpl value,
    $Res Function(_$DietPlanImpl) then,
  ) = __$$DietPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String trainerId,
    String clientId,
    String title,
    String description,
    String goal,
    int dailyCalories,
    Map<String, dynamic> macros,
    List<DietMealPlan> mealPlans,
    List<String>? restrictions,
    String? notes,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$DietPlanImplCopyWithImpl<$Res>
    extends _$DietPlanCopyWithImpl<$Res, _$DietPlanImpl>
    implements _$$DietPlanImplCopyWith<$Res> {
  __$$DietPlanImplCopyWithImpl(
    _$DietPlanImpl _value,
    $Res Function(_$DietPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trainerId = null,
    Object? clientId = null,
    Object? title = null,
    Object? description = null,
    Object? goal = null,
    Object? dailyCalories = null,
    Object? macros = null,
    Object? mealPlans = null,
    Object? restrictions = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DietPlanImpl(
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
        clientId:
            null == clientId
                ? _value.clientId
                : clientId // ignore: cast_nullable_to_non_nullable
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
        goal:
            null == goal
                ? _value.goal
                : goal // ignore: cast_nullable_to_non_nullable
                    as String,
        dailyCalories:
            null == dailyCalories
                ? _value.dailyCalories
                : dailyCalories // ignore: cast_nullable_to_non_nullable
                    as int,
        macros:
            null == macros
                ? _value._macros
                : macros // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        mealPlans:
            null == mealPlans
                ? _value._mealPlans
                : mealPlans // ignore: cast_nullable_to_non_nullable
                    as List<DietMealPlan>,
        restrictions:
            freezed == restrictions
                ? _value._restrictions
                : restrictions // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
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
class _$DietPlanImpl implements _DietPlan {
  const _$DietPlanImpl({
    required this.id,
    required this.trainerId,
    required this.clientId,
    required this.title,
    required this.description,
    required this.goal,
    required this.dailyCalories,
    required final Map<String, dynamic> macros,
    required final List<DietMealPlan> mealPlans,
    final List<String>? restrictions,
    this.notes,
    required this.createdAt,
    this.updatedAt,
  }) : _macros = macros,
       _mealPlans = mealPlans,
       _restrictions = restrictions;

  factory _$DietPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DietPlanImplFromJson(json);

  @override
  final String id;
  @override
  final String trainerId;
  @override
  final String clientId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String goal;
  // weight loss, muscle gain, maintenance
  @override
  final int dailyCalories;
  final Map<String, dynamic> _macros;
  @override
  Map<String, dynamic> get macros {
    if (_macros is EqualUnmodifiableMapView) return _macros;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_macros);
  }

  // protein, carbs, fats percentages
  final List<DietMealPlan> _mealPlans;
  // protein, carbs, fats percentages
  @override
  List<DietMealPlan> get mealPlans {
    if (_mealPlans is EqualUnmodifiableListView) return _mealPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mealPlans);
  }

  final List<String>? _restrictions;
  @override
  List<String>? get restrictions {
    final value = _restrictions;
    if (value == null) return null;
    if (_restrictions is EqualUnmodifiableListView) return _restrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  // dietary restrictions
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DietPlan(id: $id, trainerId: $trainerId, clientId: $clientId, title: $title, description: $description, goal: $goal, dailyCalories: $dailyCalories, macros: $macros, mealPlans: $mealPlans, restrictions: $restrictions, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trainerId, trainerId) ||
                other.trainerId == trainerId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.dailyCalories, dailyCalories) ||
                other.dailyCalories == dailyCalories) &&
            const DeepCollectionEquality().equals(other._macros, _macros) &&
            const DeepCollectionEquality().equals(
              other._mealPlans,
              _mealPlans,
            ) &&
            const DeepCollectionEquality().equals(
              other._restrictions,
              _restrictions,
            ) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
    clientId,
    title,
    description,
    goal,
    dailyCalories,
    const DeepCollectionEquality().hash(_macros),
    const DeepCollectionEquality().hash(_mealPlans),
    const DeepCollectionEquality().hash(_restrictions),
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietPlanImplCopyWith<_$DietPlanImpl> get copyWith =>
      __$$DietPlanImplCopyWithImpl<_$DietPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DietPlanImplToJson(this);
  }
}

abstract class _DietPlan implements DietPlan {
  const factory _DietPlan({
    required final String id,
    required final String trainerId,
    required final String clientId,
    required final String title,
    required final String description,
    required final String goal,
    required final int dailyCalories,
    required final Map<String, dynamic> macros,
    required final List<DietMealPlan> mealPlans,
    final List<String>? restrictions,
    final String? notes,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$DietPlanImpl;

  factory _DietPlan.fromJson(Map<String, dynamic> json) =
      _$DietPlanImpl.fromJson;

  @override
  String get id;
  @override
  String get trainerId;
  @override
  String get clientId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get goal; // weight loss, muscle gain, maintenance
  @override
  int get dailyCalories;
  @override
  Map<String, dynamic> get macros; // protein, carbs, fats percentages
  @override
  List<DietMealPlan> get mealPlans;
  @override
  List<String>? get restrictions; // dietary restrictions
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of DietPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietPlanImplCopyWith<_$DietPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DietMealPlan _$DietMealPlanFromJson(Map<String, dynamic> json) {
  return _DietMealPlan.fromJson(json);
}

/// @nodoc
mixin _$DietMealPlan {
  String get mealType =>
      throw _privateConstructorUsedError; // breakfast, lunch, dinner, snack
  List<DietMealItem> get items => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;

  /// Serializes this DietMealPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DietMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DietMealPlanCopyWith<DietMealPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietMealPlanCopyWith<$Res> {
  factory $DietMealPlanCopyWith(
    DietMealPlan value,
    $Res Function(DietMealPlan) then,
  ) = _$DietMealPlanCopyWithImpl<$Res, DietMealPlan>;
  @useResult
  $Res call({String mealType, List<DietMealItem> items, int calories});
}

/// @nodoc
class _$DietMealPlanCopyWithImpl<$Res, $Val extends DietMealPlan>
    implements $DietMealPlanCopyWith<$Res> {
  _$DietMealPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealType = null,
    Object? items = null,
    Object? calories = null,
  }) {
    return _then(
      _value.copyWith(
            mealType:
                null == mealType
                    ? _value.mealType
                    : mealType // ignore: cast_nullable_to_non_nullable
                        as String,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<DietMealItem>,
            calories:
                null == calories
                    ? _value.calories
                    : calories // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DietMealPlanImplCopyWith<$Res>
    implements $DietMealPlanCopyWith<$Res> {
  factory _$$DietMealPlanImplCopyWith(
    _$DietMealPlanImpl value,
    $Res Function(_$DietMealPlanImpl) then,
  ) = __$$DietMealPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mealType, List<DietMealItem> items, int calories});
}

/// @nodoc
class __$$DietMealPlanImplCopyWithImpl<$Res>
    extends _$DietMealPlanCopyWithImpl<$Res, _$DietMealPlanImpl>
    implements _$$DietMealPlanImplCopyWith<$Res> {
  __$$DietMealPlanImplCopyWithImpl(
    _$DietMealPlanImpl _value,
    $Res Function(_$DietMealPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DietMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealType = null,
    Object? items = null,
    Object? calories = null,
  }) {
    return _then(
      _$DietMealPlanImpl(
        mealType:
            null == mealType
                ? _value.mealType
                : mealType // ignore: cast_nullable_to_non_nullable
                    as String,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<DietMealItem>,
        calories:
            null == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DietMealPlanImpl implements _DietMealPlan {
  const _$DietMealPlanImpl({
    required this.mealType,
    required final List<DietMealItem> items,
    required this.calories,
  }) : _items = items;

  factory _$DietMealPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DietMealPlanImplFromJson(json);

  @override
  final String mealType;
  // breakfast, lunch, dinner, snack
  final List<DietMealItem> _items;
  // breakfast, lunch, dinner, snack
  @override
  List<DietMealItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int calories;

  @override
  String toString() {
    return 'DietMealPlan(mealType: $mealType, items: $items, calories: $calories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietMealPlanImpl &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.calories, calories) ||
                other.calories == calories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mealType,
    const DeepCollectionEquality().hash(_items),
    calories,
  );

  /// Create a copy of DietMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietMealPlanImplCopyWith<_$DietMealPlanImpl> get copyWith =>
      __$$DietMealPlanImplCopyWithImpl<_$DietMealPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DietMealPlanImplToJson(this);
  }
}

abstract class _DietMealPlan implements DietMealPlan {
  const factory _DietMealPlan({
    required final String mealType,
    required final List<DietMealItem> items,
    required final int calories,
  }) = _$DietMealPlanImpl;

  factory _DietMealPlan.fromJson(Map<String, dynamic> json) =
      _$DietMealPlanImpl.fromJson;

  @override
  String get mealType; // breakfast, lunch, dinner, snack
  @override
  List<DietMealItem> get items;
  @override
  int get calories;

  /// Create a copy of DietMealPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietMealPlanImplCopyWith<_$DietMealPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DietMealItem _$DietMealItemFromJson(Map<String, dynamic> json) {
  return _DietMealItem.fromJson(json);
}

/// @nodoc
mixin _$DietMealItem {
  String get foodName => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;
  double get protein => throw _privateConstructorUsedError;
  double get carbs => throw _privateConstructorUsedError;
  double get fats => throw _privateConstructorUsedError;

  /// Serializes this DietMealItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DietMealItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DietMealItemCopyWith<DietMealItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietMealItemCopyWith<$Res> {
  factory $DietMealItemCopyWith(
    DietMealItem value,
    $Res Function(DietMealItem) then,
  ) = _$DietMealItemCopyWithImpl<$Res, DietMealItem>;
  @useResult
  $Res call({
    String foodName,
    String quantity,
    int calories,
    double protein,
    double carbs,
    double fats,
  });
}

/// @nodoc
class _$DietMealItemCopyWithImpl<$Res, $Val extends DietMealItem>
    implements $DietMealItemCopyWith<$Res> {
  _$DietMealItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietMealItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodName = null,
    Object? quantity = null,
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fats = null,
  }) {
    return _then(
      _value.copyWith(
            foodName:
                null == foodName
                    ? _value.foodName
                    : foodName // ignore: cast_nullable_to_non_nullable
                        as String,
            quantity:
                null == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as String,
            calories:
                null == calories
                    ? _value.calories
                    : calories // ignore: cast_nullable_to_non_nullable
                        as int,
            protein:
                null == protein
                    ? _value.protein
                    : protein // ignore: cast_nullable_to_non_nullable
                        as double,
            carbs:
                null == carbs
                    ? _value.carbs
                    : carbs // ignore: cast_nullable_to_non_nullable
                        as double,
            fats:
                null == fats
                    ? _value.fats
                    : fats // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DietMealItemImplCopyWith<$Res>
    implements $DietMealItemCopyWith<$Res> {
  factory _$$DietMealItemImplCopyWith(
    _$DietMealItemImpl value,
    $Res Function(_$DietMealItemImpl) then,
  ) = __$$DietMealItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String foodName,
    String quantity,
    int calories,
    double protein,
    double carbs,
    double fats,
  });
}

/// @nodoc
class __$$DietMealItemImplCopyWithImpl<$Res>
    extends _$DietMealItemCopyWithImpl<$Res, _$DietMealItemImpl>
    implements _$$DietMealItemImplCopyWith<$Res> {
  __$$DietMealItemImplCopyWithImpl(
    _$DietMealItemImpl _value,
    $Res Function(_$DietMealItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DietMealItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodName = null,
    Object? quantity = null,
    Object? calories = null,
    Object? protein = null,
    Object? carbs = null,
    Object? fats = null,
  }) {
    return _then(
      _$DietMealItemImpl(
        foodName:
            null == foodName
                ? _value.foodName
                : foodName // ignore: cast_nullable_to_non_nullable
                    as String,
        quantity:
            null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as String,
        calories:
            null == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                    as int,
        protein:
            null == protein
                ? _value.protein
                : protein // ignore: cast_nullable_to_non_nullable
                    as double,
        carbs:
            null == carbs
                ? _value.carbs
                : carbs // ignore: cast_nullable_to_non_nullable
                    as double,
        fats:
            null == fats
                ? _value.fats
                : fats // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DietMealItemImpl implements _DietMealItem {
  const _$DietMealItemImpl({
    required this.foodName,
    required this.quantity,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  factory _$DietMealItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DietMealItemImplFromJson(json);

  @override
  final String foodName;
  @override
  final String quantity;
  @override
  final int calories;
  @override
  final double protein;
  @override
  final double carbs;
  @override
  final double fats;

  @override
  String toString() {
    return 'DietMealItem(foodName: $foodName, quantity: $quantity, calories: $calories, protein: $protein, carbs: $carbs, fats: $fats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietMealItemImpl &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.fats, fats) || other.fats == fats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    foodName,
    quantity,
    calories,
    protein,
    carbs,
    fats,
  );

  /// Create a copy of DietMealItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietMealItemImplCopyWith<_$DietMealItemImpl> get copyWith =>
      __$$DietMealItemImplCopyWithImpl<_$DietMealItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DietMealItemImplToJson(this);
  }
}

abstract class _DietMealItem implements DietMealItem {
  const factory _DietMealItem({
    required final String foodName,
    required final String quantity,
    required final int calories,
    required final double protein,
    required final double carbs,
    required final double fats,
  }) = _$DietMealItemImpl;

  factory _DietMealItem.fromJson(Map<String, dynamic> json) =
      _$DietMealItemImpl.fromJson;

  @override
  String get foodName;
  @override
  String get quantity;
  @override
  int get calories;
  @override
  double get protein;
  @override
  double get carbs;
  @override
  double get fats;

  /// Create a copy of DietMealItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietMealItemImplCopyWith<_$DietMealItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
