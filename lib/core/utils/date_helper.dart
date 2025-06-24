import 'package:intl/intl.dart';

/// Utility class for date operations
class DateHelper {
  static const String defaultDateFormat = 'yyyy-MM-dd';
  static const String defaultTimeFormat = 'HH:mm';
  static const String defaultDateTimeFormat = 'yyyy-MM-dd HH:mm';
  
  /// Format date to string
  static String formatDate(DateTime date, [String? format]) {
    return DateFormat(format ?? defaultDateFormat).format(date);
  }
  
  /// Format time to string
  static String formatTime(DateTime date, [String? format]) {
    return DateFormat(format ?? defaultTimeFormat).format(date);
  }
  
  /// Format date and time to string
  static String formatDateTime(DateTime date, [String? format]) {
    return DateFormat(format ?? defaultDateTimeFormat).format(date);
  }
  
  /// Parse string to date
  static DateTime? parseDate(String dateString, [String? format]) {
    try {
      return DateFormat(format ?? defaultDateFormat).parse(dateString);
    } catch (e) {
      return null;
    }
  }
  
  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }
  
  /// Get start of day
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
  
  /// Get end of day
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
} 