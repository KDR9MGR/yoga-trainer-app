import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// Import all screens
// Import providers/services
import 'services/user_provider.dart';
import 'services/trainer_provider.dart';
import 'services/diet_service.dart';
import 'services/progress_service.dart';
import 'services/habit_service.dart';
import 'services/notification_service.dart';
import 'services/meetup_service.dart';
import 'utils/app_routes.dart';
import 'utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TrainerProvider()),
        ChangeNotifierProvider(create: (_) => DietService()),
        ChangeNotifierProvider(create: (_) => ProgressService()),
        ChangeNotifierProvider(create: (_) => HabitService()),
        ChangeNotifierProvider(create: (_) => NotificationService()),
        ChangeNotifierProvider(create: (_) => MeetupService()),
      ],
      child: MaterialApp(
        title: 'Yoga Life',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light, // Start with light theme
        initialRoute: AppRoutes.welcome,
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
              overscroll: false,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
