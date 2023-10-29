import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/domain/models/actor.dart';
import 'package:widgets/domain/usecases/actor_usecase.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final dynamic data;

  final actorUsecae = Get.find<ActorUsecases>();
  Actor? actor;
  late TabController tabController;

  int currentIndex = 0;

  HomeController(this.data);

  @override
  void onInit() {
    tabController =
        TabController(length: 4, vsync: this, initialIndex: currentIndex);
    super.onInit();
    getData();
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

  void getData() async {
    final response = await actorUsecae.getActor();
    if (response is DataSuccess<Actor>) {
      print(response.data);
      actor = response.data;
      update();
    } else if (response is DataFailure<Actor>) {
      print(response.message);
    }
  }
}
