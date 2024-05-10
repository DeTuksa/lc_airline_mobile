import 'package:flutter/material.dart';
import 'package:lc_airline/core/presentation/constants/app_strings.dart';
import 'package:lc_airline/core/presentation/helpers/hex_color.dart';

class AppTheme {
  static MaterialColor primarySwatch =
      const MaterialColor(0xFF9B0041, <int, Color>{
    50: Color(0xFFF2F9FF),
    100: Color(0xFFE6F3FF),
    200: Color(0xFFBFE1FF),
    300: Color(0xFF99CEFF),
    400: Color(0xFF4DAAFF),
    500: Color(0xFF0085FF),
    600: Color(0xFF0078E6),
    700: Color(0xFF0064BF),
    800: Color(0xFF005099),
    900: Color(0xFF00417D)
  });

  static MaterialColor primaryGrey =
      const MaterialColor(0xFFF1F1F1, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF2F4F7),
    200: Color(0xFFE4E7EC),
    300: Color(0xFFD0D5DD),
    400: Color(0xFF98A2B3),
    500: Color(0xFF667085),
    600: Color(0xFF475467),
    700: Color(0xFF344054),
    800: Color(0xFF1D2939),
    900: Color(0xFF101828)
  });

  static Color primary = HexColor("#0DCDAA");
  static Color textColor = HexColor("#333333");
  static Color disabledColor = primaryGrey.shade200;
  static Color enabledColor = const Color(0xFFD0D4DD);
  static Color errorColor = const Color(0xFFC52A6B);
  static Color successColor = const Color(0xFF00904A);
  static Color warningColor = HexColor("#FFB715");
  static Color darkBlue = HexColor("#0C344D");
  static Color fillColor = HexColor("#E5E5E5");
  static Color grey = HexColor("#F8F8F8");
  static Color darkTextColor = const Color.fromARGB(255, 240, 231, 231);
  static Color lightTextColor = const Color.fromARGB(255, 21, 21, 21);

  static IconThemeData get _iconTheme {
    return const IconThemeData(color: Colors.black);
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: Colors.white,
        secondary: primary,
        onSecondary: Colors.white,
        error: errorColor,
        onError: Colors.white,
        background: Colors.white,
        onBackground: primary,
        surface: Colors.white,
        onSurface: primary,
      ),
      fontFamily: AppStrings.fontFamily,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0.5,
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
      ),
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: _lightTextTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: const Color.fromARGB(255, 24, 24, 24),
        secondary: primary,
        onSecondary: const Color.fromARGB(255, 24, 24, 24),
        error: errorColor,
        onError: const Color.fromARGB(255, 24, 24, 24),
        background: const Color.fromARGB(255, 24, 24, 24),
        onBackground: primary,
        surface: const Color.fromARGB(255, 24, 24, 24),
        onSurface: primary,
      ),
      fontFamily: AppStrings.fontFamily,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        elevation: 0.5,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 24, 24, 24),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: _darkTextTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
    );
  }

  static TextTheme get _lightTextTheme {
    return TextTheme(
      displayLarge: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w700, color: lightTextColor),
      displayMedium: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w700, color: lightTextColor),
      displaySmall: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w700, color: lightTextColor),
      headlineLarge: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w600, color: lightTextColor),
      headlineMedium: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w600, color: lightTextColor),
      headlineSmall: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: lightTextColor),
      titleLarge: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: lightTextColor),
      titleMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: lightTextColor),
      titleSmall: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: lightTextColor),
      labelLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w700, color: lightTextColor),
      labelMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w700, color: lightTextColor),
      labelSmall: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w700, color: lightTextColor),
      bodyLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: lightTextColor),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w400, color: lightTextColor),
      bodySmall: TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.w400, color: lightTextColor),
    );
  }

  static TextTheme get _darkTextTheme {
    return TextTheme(
      displayLarge: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w700, color: darkTextColor),
      displayMedium: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w700, color: darkTextColor),
      displaySmall: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w700, color: darkTextColor),
      headlineLarge: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w600, color: darkTextColor),
      headlineMedium: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w600, color: darkTextColor),
      headlineSmall: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: darkTextColor),
      titleLarge: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: darkTextColor),
      titleMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: darkTextColor),
      titleSmall: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: darkTextColor),
      labelLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w700, color: darkTextColor),
      labelMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w700, color: darkTextColor),
      labelSmall: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w700, color: darkTextColor),
      bodyLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: darkTextColor),
      bodyMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w400, color: darkTextColor),
      bodySmall: TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.w400, color: darkTextColor),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: disabledColor, width: 0.5)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: disabledColor, width: 0.5)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primary, width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: errorColor, width: 1)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: errorColor, width: 0.5),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.all(15),
      errorStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Color(0xFFFF0404),
      ),
      filled: true,
      fillColor: primaryGrey.shade200,
      hintStyle: TextStyle(
        color: primaryGrey.shade600,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.maxFinite, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.white,
        backgroundColor: primary,
        disabledBackgroundColor: disabledColor,
        disabledForegroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.maxFinite, 48),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: primary)),
        foregroundColor: primary,
        disabledForegroundColor: disabledColor,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.maxFinite, 48),
        foregroundColor: primary,
        disabledForegroundColor: disabledColor,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  // static ThemeData getThemeData(BuildContext context) {
  //   final ThemeMode themeMode = context.read<ThemeBloc>().state;
  //   return themeMode == ThemeMode.dark ? darkTheme : lightTheme;
  // }
}
