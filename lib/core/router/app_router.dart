import 'package:go_router/go_router.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';
import 'package:trainer_manager_pro/features/auth/presentation/pages/sign_in_page.dart';
import 'package:trainer_manager_pro/features/auth/presentation/pages/sign_up_page.dart';
import 'package:trainer_manager_pro/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:trainer_manager_pro/features/classes/presentation/pages/classes_page.dart';
import 'package:trainer_manager_pro/features/students/presentation/pages/students_page.dart';
import 'package:trainer_manager_pro/features/diet_plans/presentation/pages/diet_plans_page.dart';
import 'package:trainer_manager_pro/features/profile/presentation/pages/profile_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppConstants.loginRoute,
  routes: [
    // Auth Routes
    GoRoute(
      path: AppConstants.loginRoute,
      name: 'login',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: AppConstants.signupRoute,
      name: 'signup',
      builder: (context, state) => const SignUpPage(),
    ),
    
    // Dashboard Route - Main trainer dashboard with analytics
    GoRoute(
      path: AppConstants.dashboardRoute,
      name: 'dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    
    // Classes Routes - Core feature for creating and managing yoga classes
    GoRoute(
      path: AppConstants.classesRoute,
      name: 'classes',
      builder: (context, state) => const ClassesPage(),
    ),
    
    // Students Routes - View enrolled students (read-only)
    GoRoute(
      path: AppConstants.studentsRoute,
      name: 'students',
      builder: (context, state) => const StudentsPage(),
    ),
    
    // Profile Routes - Trainer profile management
    GoRoute(
      path: AppConstants.profileRoute,
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: AppConstants.dietPlansRoute,
      name: 'diet-plans',
      builder: (context, state) => const DietPlansPage(),
    ),
  ],
); 