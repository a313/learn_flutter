// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:widgets/theme/app_colors.dart';

extension BuildContextExt on BuildContext {
  bool get isDarkTheme => false;

  Color get Primary =>
      isDarkTheme ? AppDarkColors.primaryColor : AppLightColors.Primary;
  Color get Secondary =>
      isDarkTheme ? AppDarkColors.neutral1100 : AppLightColors.Secondary;
  Color get Secondary2 =>
      isDarkTheme ? AppDarkColors.neutral1000 : AppLightColors.Secondary2;
  Color get Disabled =>
      isDarkTheme ? AppDarkColors.neutral900 : AppLightColors.Disabled;
  Color get Success =>
      isDarkTheme ? AppDarkColors.neutral800 : AppLightColors.Success;
  Color get Informative =>
      isDarkTheme ? AppDarkColors.neutral700 : AppLightColors.Informative;
  Color get Warning =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.Warning;
  Color get Error =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.Error;
  Color get BlackS00 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.BlackS00;
  Color get BlackS01 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.BlackS01;
  Color get BlackS03 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.BlackS03;
  Color get Duotone1 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.Duotone1;
  Color get Duotone2 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.Duotone2;
  Color get Duotone3 =>
      isDarkTheme ? AppDarkColors.neutral600 : AppLightColors.Duotone3;
}
