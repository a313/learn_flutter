import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final dynamic data;

  late TabController tabController;

  int currentIndex = 0;

  HomeController(this.data);

  @override
  void onInit() {
    tabController =
        TabController(length: 4, vsync: this, initialIndex: currentIndex);
    super.onInit();
  }

  void returnVal() {
    Get.back(result: 'Data from home');
  }

  callBack() {
    // Get.find<OnboardingController>().callbackFunction('abc');
  }

  void onTapIndex(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    tabController.animateTo(currentIndex);
    update();
  }
}
