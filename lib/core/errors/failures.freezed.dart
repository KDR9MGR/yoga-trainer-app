// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
    _$ServerFailureImpl value,
    $Res Function(_$ServerFailureImpl) then,
  ) = __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
    _$ServerFailureImpl _value,
    $Res Function(_$ServerFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ServerFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.serverFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) {
    return serverFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) {
    return serverFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements Failure {
  const factory ServerFailure(final String message) = _$ServerFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ConnectionFailureImplCopyWith(
    _$ConnectionFailureImpl value,
    $Res Function(_$ConnectionFailureImpl) then,
  ) = __$$ConnectionFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConnectionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConnectionFailureImpl>
    implements _$$ConnectionFailureImplCopyWith<$Res> {
  __$$ConnectionFailureImplCopyWithImpl(
    _$ConnectionFailureImpl _value,
    $Res Function(_$ConnectionFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ConnectionFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ConnectionFailureImpl implements ConnectionFailure {
  const _$ConnectionFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.connectionFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionFailureImplCopyWith<_$ConnectionFailureImpl> get copyWith =>
      __$$ConnectionFailureImplCopyWithImpl<_$ConnectionFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) {
    return connectionFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) {
    return connectionFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (connectionFailure != null) {
      return connectionFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return connectionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return connectionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (connectionFailure != null) {
      return connectionFailure(this);
    }
    return orElse();
  }
}

abstract class ConnectionFailure implements Failure {
  const factory ConnectionFailure(final String message) =
      _$ConnectionFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionFailureImplCopyWith<_$ConnectionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
    _$AuthFailureImpl value,
    $Res Function(_$AuthFailureImpl) then,
  ) = __$$AuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
    _$AuthFailureImpl _value,
    $Res Function(_$AuthFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AuthFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.authFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) {
    return authFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) {
    return authFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return authFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return authFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements Failure {
  const factory AuthFailure(final String message) = _$AuthFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(
    _$ValidationFailureImpl value,
    $Res Function(_$ValidationFailureImpl) then,
  ) = __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(
    _$ValidationFailureImpl _value,
    $Res Function(_$ValidationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ValidationFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ValidationFailureImpl implements ValidationFailure {
  const _$ValidationFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.validationFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) {
    return validationFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) {
    return validationFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (validationFailure != null) {
      return validationFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return validationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return validationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (validationFailure != null) {
      return validationFailure(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure implements Failure {
  const factory ValidationFailure(final String message) =
      _$ValidationFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(
    _$NotFoundFailureImpl value,
    $Res Function(_$NotFoundFailureImpl) then,
  ) = __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
    _$NotFoundFailureImpl _value,
    $Res Function(_$NotFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotFoundFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundFailureImpl implements NotFoundFailure {
  const _$NotFoundFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.notFoundFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) {
    return notFoundFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) {
    return notFoundFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (notFoundFailure != null) {
      return notFoundFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return notFoundFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return notFoundFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (notFoundFailure != null) {
      return notFoundFailure(this);
    }
    return orElse();
  }
}

abstract class NotFoundFailure implements Failure {
  const factory NotFoundFailure(final String message) = _$NotFoundFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$PermissionFailureImplCopyWith(
    _$PermissionFailureImpl value,
    $Res Function(_$PermissionFailureImpl) then,
  ) = __$$PermissionFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PermissionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PermissionFailureImpl>
    implements _$$PermissionFailureImplCopyWith<$Res> {
  __$$PermissionFailureImplCopyWithImpl(
    _$PermissionFailureImpl _value,
    $Res Function(_$PermissionFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$PermissionFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$PermissionFailureImpl implements PermissionFailure {
  const _$PermissionFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.permissionFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionFailureImplCopyWith<_$PermissionFailureImpl> get copyWith =>
      __$$PermissionFailureImplCopyWithImpl<_$PermissionFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) {
    return permissionFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) {
    return permissionFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (permissionFailure != null) {
      return permissionFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return permissionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return permissionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (permissionFailure != null) {
      return permissionFailure(this);
    }
    return orElse();
  }
}

abstract class PermissionFailure implements Failure {
  const factory PermissionFailure(final String message) =
      _$PermissionFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionFailureImplCopyWith<_$PermissionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(
    _$UnexpectedFailureImpl value,
    $Res Function(_$UnexpectedFailureImpl) then,
  ) = __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(
    _$UnexpectedFailureImpl _value,
    $Res Function(_$UnexpectedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UnexpectedFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unexpectedFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverFailure,
    required TResult Function(String message) connectionFailure,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) validationFailure,
    required TResult Function(String message) notFoundFailure,
    required TResult Function(String message) permissionFailure,
    required TResult Function(String message) unexpectedFailure,
  }) {
    return unexpectedFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverFailure,
    TResult? Function(String message)? connectionFailure,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? validationFailure,
    TResult? Function(String message)? notFoundFailure,
    TResult? Function(String message)? permissionFailure,
    TResult? Function(String message)? unexpectedFailure,
  }) {
    return unexpectedFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverFailure,
    TResult Function(String message)? connectionFailure,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? validationFailure,
    TResult Function(String message)? notFoundFailure,
    TResult Function(String message)? permissionFailure,
    TResult Function(String message)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (unexpectedFailure != null) {
      return unexpectedFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(ValidationFailure value) validationFailure,
    required TResult Function(NotFoundFailure value) notFoundFailure,
    required TResult Function(PermissionFailure value) permissionFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return unexpectedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(ConnectionFailure value)? connectionFailure,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(ValidationFailure value)? validationFailure,
    TResult? Function(NotFoundFailure value)? notFoundFailure,
    TResult? Function(PermissionFailure value)? permissionFailure,
    TResult? Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return unexpectedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(ValidationFailure value)? validationFailure,
    TResult Function(NotFoundFailure value)? notFoundFailure,
    TResult Function(PermissionFailure value)? permissionFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (unexpectedFailure != null) {
      return unexpectedFailure(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure(final String message) =
      _$UnexpectedFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
