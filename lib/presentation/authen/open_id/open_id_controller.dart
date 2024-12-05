import 'dart:developer';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:widgets/routes/routes.dart';

class OpenIdController extends GetxController {
  late final WebViewController webController;

  final clientId = '8B08047B-4C10-4A76-AA5E-17412D7FE416';
  final redirectUri = 'https://test.consio.no/OpenIdtest/';
  final nonce = 'AqKGYZXbAhLijdXFtNVF6Hdd8us%3d';
  @override
  void onInit() {
    super.onInit();
    //10107561
    //tamtest
    final urlStr =
        'https://test.consio.no/authminside/connect/authorize?client_id=$clientId&redirect_uri=$redirectUri&response_type=id_token+token&grant_type=implicit&scope=openid+profile&nonce=$nonce';

    final initUri = Uri.parse(urlStr);

    const callbackUrl = 'https://test.consio.no/OpenIdtest';

    webController = WebViewController();
    webController.setNavigationDelegate(
      NavigationDelegate(onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith(callbackUrl)) {
          final uri = Uri.parse(request.url);
          final fragment = uri.fragment;
          final token = extractBetween(fragment, 'access_token=', '&');
          loginSuccess(token);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }),
    );
    webController.loadRequest(initUri);
  }

  String extractBetween(String input, String startKey, String endKey) {
    int startIndex = input.indexOf(startKey);
    if (startIndex == -1) return '';
    int endIndex = input.indexOf(endKey, startIndex + startKey.length);
    if (endIndex == -1) return '';
    return input.substring(startIndex + startKey.length, endIndex);
  }

  void loginSuccess(String token) {
    //TODO
    // Store token
    log(token, name: 'Access Token');
    Get.offAllNamed(Routes.home);
  }
}
