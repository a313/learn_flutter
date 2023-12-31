import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';

import 'melding_controller.dart';
import 'components/header_component.dart';
import 'components/list_data_component.dart';

class MeldingPage extends GetView<MeldingController> {
  const MeldingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Meldinger',
      body: GetBuilder<MeldingController>(
        builder: (_) {
          return Column(
            children: [
              HeaderComponent(
                nextWeek: controller.nextWeek,
                prevWeek: controller.prevWeek,
                week: controller.currentWeek,
                time: controller.timeStr,
              ),
              Expanded(
                  child: ListDataComponent(
                data: controller.formattedData,
                onOpenDetail: controller.onOpenDetail,
              )),
            ],
          );
        },
      ),
    );
  }
}
