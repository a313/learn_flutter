import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final data = Get.arguments;

    Get.put<HomeController>(HomeController(data));
  }
}
