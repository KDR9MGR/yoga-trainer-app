import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all failures
@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverFailure(String message) = ServerFailure;
  const factory Failure.connectionFailure(String message) = ConnectionFailure;
  const factory Failure.authFailure(String message) = AuthFailure;
  const factory Failure.validationFailure(String message) = ValidationFailure;
  const factory Failure.notFoundFailure(String message) = NotFoundFailure;
  const factory Failure.permissionFailure(String message) = PermissionFailure;
  const factory Failure.unexpectedFailure(String message) = UnexpectedFailure;
}

/// Extension to get user-friendly error messages
extension FailureExtension on Failure {
  String get message {
    return when(
      serverFailure: (message) => message,
      connectionFailure: (message) => message,
      authFailure: (message) => message,
      validationFailure: (message) => message,
      notFoundFailure: (message) => message,
      permissionFailure: (message) => message,
      unexpectedFailure: (message) => message,
    );
  }
} 