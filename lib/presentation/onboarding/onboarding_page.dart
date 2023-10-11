import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';
import 'package:widgets/sharedWidgets/my_button.dart';

import 'onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Onboarding',
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) => Container(
                  color: Colors.green,
                  child: Center(child: Text(controller.items[index])),
                ),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: MyButton.P1Primary(
                    title: 'Skip', onPressed: controller.onSkip)),
            MyButton.P1Secondary(title: 'Skip', onPressed: controller.onSkip),
            MyButton.S2Primary(title: 'Skip', onPressed: controller.onSkip),
            MyButton.S2Secondary(title: 'Skip', onPressed: controller.onSkip),
          ],
        ));
  }
}
