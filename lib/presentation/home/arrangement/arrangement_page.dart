import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';

import 'arrangement_controller.dart';

class ArrangementPage extends GetView<ArrangementController> {
  const ArrangementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Arrangement',
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
