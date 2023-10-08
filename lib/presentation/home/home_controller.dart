import 'package:get/get.dart';

class HomeController extends GetxController {
  final dynamic data;

  HomeController(this.data);

  void returnVal() {
    Get.back(result: 'Data from home');
  }

  callBack() {
    // Get.find<OnboardingController>().callbackFunction('abc');
  }
}
