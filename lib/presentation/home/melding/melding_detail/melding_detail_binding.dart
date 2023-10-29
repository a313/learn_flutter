import 'package:get/get.dart';
import 'melding_detail_controller.dart';

class MeldingDetailBinding implements Bindings {
  @override
  void dependencies() {
    final item = Get.arguments;
    Get.put<MeldingDetailController>(MeldingDetailController(melding: item));
  }
}
