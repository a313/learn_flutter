import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/domain/usecases/local_usecase.dart';
import 'package:widgets/routes/pages.dart';
import 'package:widgets/routes/routes.dart';
import 'package:widgets/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late String initialRoute;

  @override
  void initState() {
    if (Get.find<LocalUsecase>().isShowOnboard()) {
      initialRoute = Routes.login;
    } else {
      initialRoute = Routes.onboarding;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme().lightTheme,
      getPages: Pages.pages,
      initialRoute: initialRoute,
    );
  }

  @override
  void didUpdateWidget(covariant App oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
}
