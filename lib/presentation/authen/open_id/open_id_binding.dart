
import 'package:get/get.dart';
import 'open_id_controller.dart';

class OpenIdBinding implements Bindings {
@override
void dependencies() {
    Get.put<OpenIdController>(OpenIdController());
}
}