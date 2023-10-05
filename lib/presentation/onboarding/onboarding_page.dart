import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';
import 'package:widgets/sharedWidgets/my_button.dart';

import 'onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafold(
        body: Column(
      children: [
        MyButton.primary(title: 'Next Page', onPressed: controller.nextPage)
      ],
    ));
  }
}
