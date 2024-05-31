import 'package:get/get.dart';
import 'package:widgets/presentation/authen/login/login_binding.dart';
import 'package:widgets/presentation/authen/login/login_page.dart';
import 'package:widgets/presentation/authen/open_id/open_id_binding.dart';
import 'package:widgets/presentation/authen/open_id/open_id_page.dart';
import 'package:widgets/presentation/home/arrangement/arrangement_binding.dart';
import 'package:widgets/presentation/home/home_binding.dart';
import 'package:widgets/presentation/home/home_page.dart';
import 'package:widgets/presentation/home/melding/melding_binding.dart';
import 'package:widgets/presentation/home/melding/melding_detail/melding_detail_binding.dart';
import 'package:widgets/presentation/home/melding/melding_detail/melding_detail_page.dart';
import 'package:widgets/presentation/onboarding/onboarding_binding.dart';
import 'package:widgets/presentation/onboarding/onboarding_page.dart';
import 'package:widgets/routes/routes.dart';

class Pages {
  static final pages = <GetPage>[
    GetPage(
        name: Routes.onboarding,
        page: () => const OnboardingPage(),
        binding: OnboardingBinding()),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(name: Routes.home, page: () => const HomePage(), bindings: [
      HomeBinding(),
      ArrangementBinding(),
      MeldingBinding(),
    ]),
    GetPage(
      name: Routes.meldingDetail,
      page: () => const MeldingDetailPage(),
      binding: MeldingDetailBinding(),
    ),
    GetPage(
      name: Routes.openId,
      page: () => const OpenIdPage(),
      binding: OpenIdBinding(),
      fullscreenDialog: true,
    ),
  ];
}
