import 'package:get/get.dart';

import 'melding_controller.dart';

class MeldingBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<ArrangementController>(ArrangementController());
    Get.lazyPut(() => MeldingController());
  }
}
