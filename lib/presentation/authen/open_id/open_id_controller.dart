import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenIdController extends GetxController {
  late final WebViewController webController;
  @override
  void onInit() {
    super.onInit();
    final initUri = Uri.parse(
        'https://test.consio.no/OpenIdserver/connect/authorize?client_id=3609848B-B4D3-4DD0-8E65-83276315688D&redirect_uri=https%3a%2f%2ftest.consio.no%2fInternTestLoginID%2fauthentication%2flogin-callback&response_type=id_token+token&grant_type=implicit&scope=openid+profile&nonce=v0cvCsMuen3itBy68ODV5TxFHH8%3d');

    webController = WebViewController();
    webController.setNavigationDelegate(
      NavigationDelegate(onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith(
            'https://test.consio.no/InternTestLoginID/authentication/login-callback')) {
          final uri = Uri.parse(request.url);
          final fragment = uri.fragment;
          final token = fragment.replaceAll('access_token=', '').split('&')[0];
          Get.back(result: token);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }),
    );
    webController.loadRequest(initUri);
  }
}
