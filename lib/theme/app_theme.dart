import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/theme/app_colors.dart';
import 'package:widgets/theme/app_font.dart';

class AppTheme {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: AppLightColors.BlackS00,
    appBarTheme: const AppBarTheme().copyWith(
        color: AppLightColors.BlackS00,
        elevation: 0,
        centerTitle: false,
        titleTextStyle:
            AppFonts.Medium20.copyWith(color: AppLightColors.Primary),
        iconTheme: IconThemeData(color: AppLightColors.Primary)),
  );
}
