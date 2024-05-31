import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';

import 'open_id_controller.dart';

class OpenIdPage extends GetView<OpenIdController> {
  const OpenIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: WebViewWidget(controller: controller.webController));
  }
}
