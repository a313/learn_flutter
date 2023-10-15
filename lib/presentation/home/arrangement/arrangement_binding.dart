import 'package:get/get.dart';

import 'arrangement_controller.dart';

class ArrangementBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<ArrangementController>(ArrangementController());
    Get.lazyPut(() => ArrangementController());
  }
}
