import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:widgets/routes/pages.dart';
import 'package:widgets/routes/routes.dart';
import 'package:widgets/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme().lightTheme,
      getPages: Pages.pages,
      initialRoute: Routes.onboarding,
    );
  }
}
