import 'package:flutter/material.dart';
import 'package:widgets/theme/app_colors.dart';

extension BuildContextExt on BuildContext {
  bool get isDarkTheme => true;
  Color get primaryColor =>
      isDarkTheme ? AppDarkColors.primaryColor : AppLightColors.primaryColor;

  Color get neutral600 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.neutral600;
}
