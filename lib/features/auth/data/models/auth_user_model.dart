import 'package:supabase_flutter/supabase_flutter.dart' hide AuthUser;
import 'package:trainer_manager_pro/features/auth/domain/entities/auth_user.dart';

/// Data model for AuthUser with additional methods
class AuthUserModel {
  /// Create from Supabase User
  static AuthUser fromUser(User user) {
    return AuthUser(
      id: user.id,
      email: user.email ?? '',
      fullName: user.userMetadata?['full_name'] as String?,
      profileImageUrl: user.userMetadata?['avatar_url'] as String?,
      isTrainer: user.userMetadata?['is_trainer'] as bool? ?? false,
      createdAt: DateTime.parse(user.createdAt),
    );
  }

  /// Create from JSON
  static AuthUser fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      isTrainer: json['is_trainer'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Convert to JSON
  static Map<String, dynamic> toJson(AuthUser user) {
    return {
      'id': user.id,
      'email': user.email,
      'full_name': user.fullName,
      'profile_image_url': user.profileImageUrl,
      'is_trainer': user.isTrainer,
      'created_at': user.createdAt.toIso8601String(),
    };
  }
} 