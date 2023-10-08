import 'package:flutter/material.dart';
import 'package:widgets/theme/app_colors.dart';

extension BuildContextExt on BuildContext {
  bool get isDarkTheme => true;

  Color get primaryColor =>
      isDarkTheme ? AppDarkColors.primaryColor : AppLightColors.primaryColor;
  Color get neutral1100 =>
      isDarkTheme ? AppDarkColors.neutral1100 : AppLightColors.neutral1100;
  Color get neutral1000 =>
      isDarkTheme ? AppDarkColors.neutral1000 : AppLightColors.neutral1000;
  Color get neutral900 =>
      isDarkTheme ? AppDarkColors.neutral900 : AppLightColors.neutral900;
  Color get neutral800 =>
      isDarkTheme ? AppDarkColors.neutral800 : AppLightColors.neutral800;
  Color get neutral700 =>
      isDarkTheme ? AppDarkColors.neutral700 : AppLightColors.neutral700;
  Color get neutral600 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.neutral600;
  Color get neutral500 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.neutral600;
  Color get neutral400 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.neutral600;
  Color get neutral300 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.neutral600;
  Color get neutral200 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.neutral600;
  Color get neutral100 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.neutral600;
}
