import 'package:flutter/material.dart';
import '../screens/onboarding/welcome_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/trainers/trainers_list_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/diet/diet_plan_screen.dart';
import '../screens/progress/progress_screen.dart';
import '../screens/meetups/meetups_screen.dart';
import '../screens/notifications/notifications_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String dashboard = '/dashboard';
  static const String trainersList = '/trainers_list';
  static const String profile = '/profile';
  static const String progress = '/progress';
  static const String diet = '/diet';
  static const String meetups = '/meetups';
  static const String notifications = '/notifications';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case trainersList:
        return MaterialPageRoute(builder: (_) => const TrainersListScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case progress:
        return MaterialPageRoute(builder: (_) => const ProgressScreen());
      case diet:
        return MaterialPageRoute(builder: (_) => const DietPlanScreen());
      case meetups:
        return MaterialPageRoute(builder: (_) => const MeetupsScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
} 