
class AppConstants {
  // App Information
  static const String appName = 'Yoga App';
  static const String appVersion = '1.0.0';
  
  // API Endpoints
  static const String baseApiUrl = 'https://api.yogaapp.com';
  
  // Asset Paths
  static const String defaultProfileImage = 'assets/images/default_profile.png';
  static const String appLogo = 'assets/images/logo.png';
  
  // Routes
  static const String welcomeRoute = '/welcome';
  static const String homeRoute = '/home';
  static const String trainersRoute = '/trainers';
  static const String trainerProfileRoute = '/trainer_profile';
  static const String classBookingRoute = '/class_booking';
  static const String progressRoute = '/progress';
  static const String dietPlanRoute = '/diet_plan';
  static const String meetupsRoute = '/meetups';
  static const String notificationsRoute = '/notifications';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
  static const double cardElevation = 4.0;
  
  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration pageTransitionDuration = Duration(milliseconds: 200);
  
  // Error Messages
  static const String networkErrorMessage = 'Please check your internet connection';
  static const String generalErrorMessage = 'Something went wrong. Please try again';
  static const String sessionExpiredMessage = 'Your session has expired. Please login again';
  
  // Cache Keys
  static const String userCacheKey = 'user_data';
  static const String themeCacheKey = 'app_theme';
  static const String tokenCacheKey = 'auth_token';
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxNameLength = 50;
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  
  // Feature Flags
  static const bool enablePushNotifications = true;
  static const bool enableLocationServices = true;
  static const bool enableAnalytics = true;
} 