import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:widgets/routes/pages.dart';
import 'package:widgets/routes/routes.dart';
import 'package:widgets/theme/app_theme.dart';

import 'domain/usecases/local_usecase.dart';

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
      initialRoute = Routes.openId;
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
      locale: const Locale('no', 'NO'),
      supportedLocales: const [Locale('no', 'NO')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  @override
  void didUpdateWidget(covariant App oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
}
