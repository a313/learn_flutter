import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/presentation/home/home_page.dart';

import '../../routes/routes.dart';

class OnboardingController extends GetxController {
  //TODO
  void nextPage() {
    // Trang hiện tại A
    // Trang cần đến là G

    Get.toNamed(Routes.home); // A->G
    Get.offNamed(Routes.home); // A remove -> G
    Get.offNamedUntil(Routes.home,
        ModalRoute.withName(Routes.login)); // A -> B -> C -> D => A -> G
    Get.offAllNamed(Routes.home); // A -> B -> C -> D => G

    Get.to(() => const HomePage());
    Get.off(() => const HomePage());
    Get.until((route) => false);
    Get.offAll(() => const HomePage());
  }
}
