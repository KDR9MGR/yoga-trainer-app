
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

/// Sophisticated app theme configuration with curated color palette
class AppTheme {
  // Primary colors from the curated palette
  static const Color primaryNavy = Color(0xFF092E4E);        // Deep navy blue (primary)
  static const Color primaryTeal = Color(0xFF092E4E);        // Sophisticated teal
  static const Color accentTeal = Color(0xFF4ECDC4);         // Light teal accent
  static const Color richBlue = Color(0xFF1E3A5F);           // Rich blue
  static const Color deepNavy = Color(0xFF0F1B2E);           // Darkest navy
  
  // Light neutral colors from palette
  static const Color lightBeige = Color(0xFFF5F1E8);         // Warm beige
  static const Color softGray = Color(0xFFE8E8E8);           // Light gray
  static const Color paleGray = Color(0xFFF0F0F0);           // Very light gray
  static const Color coolGray = Color(0xFFE0E8E8);           // Cool light gray
  static const Color pureWhite = Color(0xFFFFFFFF);          // Pure white
  
  // Semantic colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color errorColor = Color(0xFFF44336);
  static const Color infoColor = Color(0xFF2196F3);
  
  // Enhanced text colors for optimal readability
  static const Color textPrimary = Color(0xFF092E4E);        // Primary navy for main text
  static const Color textSecondary = Color(0xFF1E3A5F);      // Rich blue for secondary text
  static const Color textTertiary = Color(0xFF6B7280);       // Medium gray for tertiary text
  static const Color textOnPrimary = Color(0xFFFFFFFF);      // White text on colored backgrounds
  static const Color textOnLight = Color(0xFF092E4E);        // Navy text on light backgrounds
  
  // Sophisticated background system
  static const Color backgroundColor = Color(0xFFF4EBDC                      );    // Clean background
  static const Color surfaceColor = Color(0xFFF1E4D0);       // Pure white surfaces
  static const Color cardColor = Color(0xFFEFE2CC);          // White cards
  static const Color accentBackground = Color(0xFFECDCC1);   // Light teal background
  static const Color borderColor = Color(0xFFE6D1AD);        // Subtle borders
  
  // Legacy compatibility
  static const Color primaryColor = primaryNavy;
  static const Color secondaryColor = primaryTeal;
  static const Color accentColor = accentTeal;
  static const Color textInverse = textOnPrimary;
  
  // Spacing constants
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  
  // Border radius constants
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusRound = 50.0;
  
  // Elevation constants
  static const double elevationS = 2.0;
  static const double elevationM = 4.0;
  static const double elevationL = 8.0;
  static const double elevationXL = 16.0;

  /// Light theme configuration with sophisticated color palette
  static ThemeData get lightTheme {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: primaryNavy,
        primaryContainer: accentBackground,
        secondary: primaryTeal,
        secondaryContainer: coolGray,
        tertiary: accentTeal,
        tertiaryContainer: paleGray,
        appBarColor: primaryNavy,
        error: errorColor,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 5,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 8,
        blendOnColors: false,
        useMaterial3Typography: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        
        // AppBar styling
        appBarBackgroundSchemeColor: SchemeColor.primary,
        appBarCenterTitle: true,
        appBarScrolledUnderElevation: 0,
        
        // Card styling
        cardRadius: radiusL,
        cardElevation: elevationS,
        
        // Button styling
        elevatedButtonRadius: radiusM,
        elevatedButtonElevation: elevationS,
        outlinedButtonRadius: radiusM,
        textButtonRadius: radiusM,
        
        // Input decoration
        inputDecoratorRadius: radiusM,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: true,
        inputDecoratorFocusedHasBorder: true,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
        
        // Navigation styling
        navigationBarBackgroundSchemeColor: SchemeColor.surface,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarUnselectedIconSchemeColor: SchemeColor.onSurfaceVariant,
        navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurfaceVariant,
        navigationBarElevation: elevationS,
        navigationBarHeight: 70,
        
        // Chip styling
        chipRadius: radiusRound,
        chipSelectedSchemeColor: SchemeColor.primary,
        chipDeleteIconSchemeColor: SchemeColor.onPrimary,
        
        // Dialog styling
        dialogRadius: radiusL,
        dialogElevation: elevationL,
        
        // Bottom sheet styling
        bottomSheetRadius: radiusL,
        bottomSheetElevation: elevationL,
        
        // Drawer styling
        drawerRadius: radiusL,
        drawerElevation: elevationM,
        
        // FAB styling
        fabRadius: radiusL,
        fabUseShape: true,
        fabSchemeColor: SchemeColor.primary,
        
        // Switch styling
        switchThumbSchemeColor: SchemeColor.primary,
        
        // Slider styling
        sliderBaseSchemeColor: SchemeColor.primary,
        sliderIndicatorSchemeColor: SchemeColor.onPrimary,
        sliderValueIndicatorType: FlexSliderIndicatorType.drop,
        
        // Tab bar styling
        tabBarIndicatorSchemeColor: SchemeColor.primary,
        tabBarItemSchemeColor: SchemeColor.primary,
        tabBarUnselectedItemSchemeColor: SchemeColor.onSurfaceVariant,
        
        // Snackbar styling
        snackBarRadius: radiusM,
        snackBarElevation: elevationM,
        snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
        
        // Tooltip styling
        tooltipRadius: radiusS,
        tooltipSchemeColor: SchemeColor.inverseSurface,
        
        // Menu styling
        menuRadius: radiusM,
        menuElevation: elevationM,
        menuBarRadius: radiusM,
        menuBarElevation: elevationS,
        
        // Segmented button styling
        segmentedButtonRadius: radiusM,
        segmentedButtonSchemeColor: SchemeColor.primary,
        segmentedButtonUnselectedSchemeColor: SchemeColor.surface,
        
        // Time picker styling
        timePickerDialogRadius: radiusL,
        timePickerElementRadius: radiusM,
        
        // Date picker styling
        datePickerDialogRadius: radiusL,
        datePickerHeaderBackgroundSchemeColor: SchemeColor.primary,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
        keepSecondary: true,
        keepTertiary: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,
    ).copyWith(
      // Custom text theme with sophisticated typography
      textTheme: _buildTextTheme(GoogleFonts.interTextTheme()),
      primaryTextTheme: _buildTextTheme(GoogleFonts.interTextTheme()),
      
      // Enhanced background colors
      scaffoldBackgroundColor: backgroundColor,
      
      // Custom component themes
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: primaryNavy,
        foregroundColor: textOnPrimary,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textOnPrimary,
        ),
      ),
      
      // Enhanced card theme
      cardTheme: CardThemeData(
        elevation: elevationS,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusL),
        ),
        color: cardColor,
        shadowColor: primaryNavy.withValues(alpha: 0.08),
      ),
      
      // Enhanced elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryNavy,
          foregroundColor: textOnPrimary,
          elevation: elevationS,
          shadowColor: primaryNavy.withValues(alpha: 0.3),
        ),
      ),
      
      // Enhanced outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryNavy,
          side: BorderSide(color: primaryNavy, width: 1.5),
        ),
      ),
      
      // Enhanced text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryTeal,
        ),
      ),
    );
  }

  /// Dark theme configuration with sophisticated dark palette
  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: primaryTeal,
        primaryContainer: richBlue,
        secondary: accentTeal,
        secondaryContainer: primaryNavy,
        tertiary: Color(0xFF7BB3FF),
        tertiaryContainer: deepNavy,
        appBarColor: deepNavy,
        error: Color(0xFFFF6B6B),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
        useMaterial3Typography: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        
        // AppBar styling
        appBarBackgroundSchemeColor: SchemeColor.surface,
        appBarCenterTitle: true,
        appBarScrolledUnderElevation: 0,
        
        // Card styling
        cardRadius: radiusL,
        cardElevation: elevationM,
        
        // Button styling
        elevatedButtonRadius: radiusM,
        elevatedButtonElevation: elevationS,
        outlinedButtonRadius: radiusM,
        textButtonRadius: radiusM,
        
        // Input decoration
        inputDecoratorRadius: radiusM,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: true,
        inputDecoratorFocusedHasBorder: true,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
        
        // Navigation styling
        navigationBarBackgroundSchemeColor: SchemeColor.surface,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarElevation: elevationS,
        navigationBarHeight: 70,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
        keepSecondary: true,
        keepTertiary: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,
    );
  }

  /// Build sophisticated text theme with enhanced hierarchy
  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w800,
        color: textPrimary,
        letterSpacing: -0.5,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.25,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.25,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: 0.0,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.0,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.0,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: textPrimary,
        height: 1.5,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
        color: textSecondary,
        height: 1.5,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontWeight: FontWeight.w400,
        color: textTertiary,
        height: 1.4,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.0,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.0,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: textTertiary,
        letterSpacing: 0.0,
      ),
    );
  }

  /// Sophisticated gradient decorations
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryNavy, primaryTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [primaryTeal, accentTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [backgroundColor, pureWhite],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Refined box shadows
  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: primaryNavy.withValues(alpha: 0.08),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get mediumShadow => [
    BoxShadow(
      color: primaryNavy.withValues(alpha: 0.12),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> get strongShadow => [
    BoxShadow(
      color: primaryNavy.withValues(alpha: 0.16),
      blurRadius: 30,
      offset: const Offset(0, 12),
    ),
  ];
} 
