/// Application-wide constants
class AppConstants {
  // App Info
  static const String appName = 'Trainer Manager Pro';
  static const String appVersion = '1.0.0';
  
  // API Constants
  static const String supabaseUrl = 'https://zqfsiwpscxsipgawlbdg.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpxZnNpd3BzY3hzaXBnYXdsYmRnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk4MjczNTcsImV4cCI6MjA2NTQwMzM1N30.TPkqpNUwp5goOL1ariQzCM_onAW_wgYfKB35pLvSdiE';
  
  // Database Tables
  static const String trainersTable = 'trainers';
  static const String classesTable = 'classes';
  static const String enrollmentsTable = 'enrollments';
  static const String paymentsTable = 'payments';
  static const String classAttendanceTable = 'class_attendance';
  static const String clientsTable = 'clients';
  
  // Storage Buckets
  static const String profileImagesBucket = 'profile-images';
  static const String classMaterialsBucket = 'class-materials';
  
  // Route Names
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String dashboardRoute = '/dashboard';
  static const String classesRoute = '/classes';
  static const String studentsRoute = '/students';
  static const String profileRoute = '/profile';
  static const String dietPlansRoute = '/diet-plans';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 12.0;
  static const double buttonBorderRadius = 8.0;
} 