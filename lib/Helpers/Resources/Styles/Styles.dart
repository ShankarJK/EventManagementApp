import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  
  static final displayLarge = GoogleFonts.montserrat(
    fontSize: 96,
    fontWeight: FontWeight.w300,
  );

  static final displayMedium = GoogleFonts.montserrat(
    fontSize: 60,
    fontWeight: FontWeight.w300,
  );

  static final displaySmall = GoogleFonts.montserrat(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  );

  static final headlineLarge = GoogleFonts.montserrat(
    fontSize: 44,
    fontWeight: FontWeight.w400,
  );

  static final headlineMedium = GoogleFonts.montserrat(
    fontSize: 34,
    fontWeight: FontWeight.w400,
  );

  static final headlineSmall = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final titleLarge = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final titleMedium = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final titleSmall = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final bodyLarge = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final bodyMedium = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final bodySmall = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final labelLarge = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final labelMedium = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final labelSmall = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static final textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );

  static final darkTheme = ThemeData(
      useMaterial3: true, brightness: Brightness.dark,  textTheme: textTheme);

  static final lightTheme = ThemeData(
      useMaterial3: true,  brightness: Brightness.light,  textTheme: textTheme);

  static TextStyle title = TextStyle(
      color: CommonColors.black, fontWeight: FontWeight.w700, fontSize: 20);
      static TextStyle description = TextStyle(
      color: CommonColors.black, fontWeight: FontWeight.w400, fontSize: 15);
  static TextStyle textFieldInputText =
      TextStyle(color: CommonColors.black, fontWeight: FontWeight.w300);

  static InputDecoration textFieldRoundedOutlineDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: CommonColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: CommonColors.grey),
    ),
    filled: true,
    fillColor: CommonColors.transparent,
  );

  static ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(CommonColors.blue));
}

class CommonColors {
  static Color blue = Colors.blue;
  static Color transparent = Colors.transparent;
  static Color grey = Colors.grey;
  static Color black = Colors.black;
}

