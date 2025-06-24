import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';
import 'package:trainer_manager_pro/core/network/supabase_client.dart';
import 'package:trainer_manager_pro/core/router/app_router.dart';
import 'package:trainer_manager_pro/shared/presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase
  await SupabaseService.initialize();
  
  runApp(
    const ProviderScope(
      child: TrainerManagerApp(),
    ),
  );
}

class TrainerManagerApp extends ConsumerWidget {
  const TrainerManagerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
