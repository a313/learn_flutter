import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';

import '../onboarding/onboarding_controller.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Home',
        body: Center(
          child: Column(
            children: [
              Text((controller.data as A).b.toString()),
              // MyButton.primary(
              //     title: 'Return', onPressed: controller.returnVal),
              // MyButton.primary(
              //     title: 'Callback', onPressed: controller.callBack)
            ],
          ),
        ));
  }
}
