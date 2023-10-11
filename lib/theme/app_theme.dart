import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/theme/app_colors.dart';

class AppTheme {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme().copyWith(
      color: AppLightColors.Primary,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
