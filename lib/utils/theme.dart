import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // New Color Palette
  static const Color primaryGreen = Color(0xFF2A4014); // Deep forest green
  static const Color lightGreen = Color(0xFFA4B57F); // Lighter, muted olive/avocado green
  static const Color beigeBackground = Color(0xFFFDFBF5); // Very light, creamy beige
  static const Color cardBackground = Colors.white; // White for cards
  static const Color darkText = Color(0xFF333333); // Dark grey for text
  static const Color textOnPrimary = Colors.white; // White text on primary green elements
  static const Color textSecondaryColor = Color(0xFF5D6A51); // Muted green/grey for secondary text

  // Feedback Colors (can be kept or adjusted if needed)
  static const Color successColor = Color(0xFF66BB6A); // Keeping existing
  static const Color errorColor = Color(0xFFE57373);   // Keeping existing
  static const Color warningColor = Color(0xFFFFB74D); // Keeping existing
  static const Color infoColor = Color(0xFF4FC3F7);     // Keeping existing

  // Gradients - can be updated if a gradient is desired with new colors
  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [primaryGreen, lightGreen], // Example using new greens
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  // Shadows - refined for a softer, modern look
  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: Colors.black.withAlpha((0.03 * 255).round()), // More subtle shadow
          blurRadius: 15,
          spreadRadius: 2,
          offset: const Offset(0, 5),
        ),
      ];

  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;
  static const double borderRadiusPill = 30.0; // For pill-shaped buttons

  // Spacing (keeping existing, they seem reasonable)
  static const double spacingXSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 32.0;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: beigeBackground,
    colorScheme: const ColorScheme.light(
      primary: primaryGreen,
      onPrimary: textOnPrimary,
      secondary: lightGreen,
      onSecondary: darkText, // Text on lightGreen elements
      surface: cardBackground,
      onSurface: darkText, // Text on cards
      error: errorColor,
      onError: Colors.white,
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: const TextStyle(
        color: darkText,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        color: darkText,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: const TextStyle(
        color: darkText,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: const TextStyle( // Using primaryGreen for major headlines
        color: primaryGreen, 
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: const TextStyle(
        color: primaryGreen,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: const TextStyle(
        color: primaryGreen,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: const TextStyle(
        color: darkText,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5, // Improved line height for readability
      ),
      bodyMedium: const TextStyle(
        color: textSecondaryColor, // Using the new secondary text color
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5, // Improved line height
      ),
      labelLarge: const TextStyle( // For button text
        color: textOnPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: textOnPrimary,
        elevation: 0, // Flat buttons, or use softShadow if preferred
        padding: const EdgeInsets.symmetric(
          horizontal: spacingLarge, // 24.0
          vertical: spacingMedium,   // 16.0
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusPill), // Pill shape
        ),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryGreen,
        side: const BorderSide(color: primaryGreen, width: 1.5),
        padding: const EdgeInsets.symmetric(
          horizontal: spacingLarge,
          vertical: spacingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusPill), // Pill shape
        ),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium), // 12.0
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1), // Subtle border for enabled state
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: const BorderSide(color: primaryGreen, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        borderSide: const BorderSide(color: errorColor, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spacingMedium, // 16.0
        vertical: spacingMedium,   // 16.0
      ),
      hintStyle: TextStyle(color: textSecondaryColor.withAlpha((0.7 * 255).round())),
    ),
    cardTheme: CardTheme(
      color: cardBackground,
      elevation: 0, // Flat cards for a cleaner look, or use AppTheme.softShadow
      // shadowColor: Colors.black.withAlpha((0.05 * 255).round()), // if elevation > 0
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusLarge), // 16.0
        // side: BorderSide(color: Colors.grey.shade200, width: 0.5) // Optional subtle border for cards
      ),
      margin: const EdgeInsets.symmetric(vertical: spacingSmall, horizontal: spacingSmall / 2), // Adjusted margin
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: beigeBackground, // Match scaffold background
      elevation: 0,
      centerTitle: true, // As per previous theme
      iconTheme: const IconThemeData(color: primaryGreen),
      titleTextStyle: GoogleFonts.inter(
        color: primaryGreen,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cardBackground, // White background for bottom nav
      selectedItemColor: primaryGreen,
      unselectedItemColor: lightGreen.withAlpha((0.8 * 255).round()), // Muted unselected items
      type: BottomNavigationBarType.fixed,
      elevation: 0, // Flat, or a very subtle top border if needed
      selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.normal),
    ),
    iconTheme: const IconThemeData(
      color: primaryGreen, // Default icon color
    ),
    chipTheme: ChipThemeData(
      backgroundColor: lightGreen.withAlpha((0.15 * 255).round()),
      labelStyle: const TextStyle(color: primaryGreen, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusMedium),
        side: BorderSide(color: lightGreen.withAlpha((0.3 * 255).round())),
      ),
      padding: const EdgeInsets.symmetric(horizontal: spacingSmall, vertical: spacingXSmall),
    )
  );

  // Primary Colors - OLD - Will be replaced by new palette
  // static const Color primaryColor = Color(0xFF7E57C2); // Soft purple
  // static const Color secondaryColor = Color(0xFF9575CD); // Light purple
  // static const Color accentColor = Color(0xFFB39DDB); // Very light purple

  // Neutral Colors - OLD - Will be replaced
  // static const Color backgroundColor = Color(0xFFFAFAFA);
  // static const Color surfaceColor = Colors.white;
  // static const Color textPrimaryColor = Color(0xFF2C3E50);
  // static const Color textSecondaryColorOld = Color(0xFF718093);


  static ThemeData get darkTheme {
    // TODO: Implement a dark theme that aligns with the new calm and modern aesthetic
    // For now, returns a basic dark theme based on primaryGreen
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen, // Use new primaryGreen for dark theme seed
        brightness: Brightness.dark,
        surface: const Color(0xFF1E1E1E),    // Dark surface for cards etc.
        onPrimary: textOnPrimary,
        onSecondary: Colors.white,
        onSurface: Colors.white.withAlpha((0.87 * 255).round()),
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
         bodyLarge: TextStyle(color: Colors.white.withAlpha((0.87 * 255).round()), height: 1.5),
         bodyMedium: TextStyle(color: Colors.white.withAlpha((0.60 * 255).round()), height: 1.5),
         // Ensure other text styles are adapted for dark theme
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E), // Dark app bar
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: lightGreen), // Lighter icons for contrast
        titleTextStyle: GoogleFonts.inter(
            color: Colors.white.withAlpha((0.87 * 255).round()),
            fontSize: 20,
            fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightGreen, // Lighter green for buttons in dark mode for contrast
          foregroundColor: primaryGreen, // Dark text on light green buttons
          padding: const EdgeInsets.symmetric(horizontal: spacingLarge, vertical: spacingMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusPill),
          ),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: lightGreen,
          side: const BorderSide(color: lightGreen, width: 1.5),
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLarge,
            vertical: spacingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusPill), 
          ),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1E1E1E), // Dark card color
        elevation: 0, // Flat cards
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusLarge),
        ),
         margin: const EdgeInsets.symmetric(vertical: spacingSmall, horizontal: spacingSmall / 2),
      ),
      scaffoldBackgroundColor: const Color(0xFF121212), // Dark scaffold
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF1E1E1E), // Dark bottom nav
        selectedItemColor: lightGreen,
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.normal),
      ),
      iconTheme: const IconThemeData(color: lightGreen),
      chipTheme: ChipThemeData(
        backgroundColor: primaryGreen.withAlpha((0.3 * 255).round()),
        labelStyle: const TextStyle(color: lightGreen, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
          side: BorderSide(color: primaryGreen.withAlpha((0.5 * 255).round())),
        ),
        padding: const EdgeInsets.symmetric(horizontal: spacingSmall, vertical: spacingXSmall),
      )
    );
  }
} 