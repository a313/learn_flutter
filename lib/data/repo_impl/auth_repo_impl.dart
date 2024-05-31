import 'dart:developer';
import 'dart:io';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:openidconnect/openidconnect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/domain/repo_abs/auth_repo_abs.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl();
  final clientId = '3609848B-B4D3-4DD0-8E65-83276315688D';
  // final redirectUrl = 'https://test.consio.no/OpenIdtest/';
  final redirectUrl =
      'https://test.consio.no/InternTestLoginID/authentication/login-callback';
  final issuer = 'https://test.consio.no/OpenIdserver';
  final scopes = ['openid', 'profile'];
  final authorizationEndpoint =
      'https://test.consio.no/OpenIdserver/connect/authorize';
  final tokenEndpoint = 'https://test.consio.no/OpenIdserver/connect/token';
  final endSessionEndpoint =
      'https://test.consio.no/OpenIdserver/connect/logout';
  final userInfoEndpoint =
      'https://test.consio.no/OpenIdserver/connect/userinfo';

  @override
  Future<DataState> login() async {
    final AuthorizationServiceConfiguration _serviceConfiguration =
        AuthorizationServiceConfiguration(
      authorizationEndpoint: authorizationEndpoint,
      tokenEndpoint: tokenEndpoint,
      endSessionEndpoint: endSessionEndpoint,
    );
    final FlutterAppAuth _appAuth = const FlutterAppAuth();
    final result = await _appAuth.authorize(
      AuthorizationRequest(
        clientId,
        redirectUrl,
        serviceConfiguration: _serviceConfiguration,
        scopes: scopes,
        issuer: issuer,
      ),
    );

    print(result);
    return DataSuccess(null);
  }

  Future<DataState> login2() async {
    var uri = Uri.parse(issuer);

    var iss = await Issuer.discover(uri);
    final client = Client(iss, clientId);

    var credential = await authenticate(client, scopes: scopes);
    print(credential);
    return DataSuccess(null);
  }

  Future<Credential> authenticate(Client client,
      {List<String> scopes = const []}) async {
    // create a function to open a browser with an url
    urlLauncher(String url) async {
      var uri = Uri.parse(
          'https://test.consio.no/OpenIdserver/connect/authorize?client_id=3609848B-B4D3-4DD0-8E65-83276315688D&redirect_uri=https%3a%2f%2ftest.consio.no%2fInternTestLoginID%2fauthentication%2flogin-callback&response_type=id_token+token&grant_type=implicit&scope=openid+profile&nonce=nTVMtirueQkcZDQHh2F2LfcJncs%3d');
      if (await canLaunchUrl(uri) || Platform.isAndroid) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = Authenticator(
      client,
      scopes: scopes,
      urlLancher: urlLauncher,
    );

    // starts the authentication
    var c = await authenticator.authorize();

    // close the webview when finished
    if (Platform.isAndroid || Platform.isIOS) {
      closeInAppWebView();
    }

    return c;
  }

  Future<Credential?> getRedirectResult(Client client,
      {List<String> scopes = const []}) async {
    return null;
  }

  Future<DataState> login3() async {
    final configuration = await OpenIdConnect.getConfiguration(
        'https://test.consio.no/OpenIdserver/.well-known/openid-configuration');

    final response = await OpenIdConnect.authorizeInteractive(
        context: Get.context!,
        title: 'ABC',
        request: await InteractiveAuthorizationRequest.create(
          clientId: clientId,
          clientSecret: 'tamtest',
          redirectUrl: redirectUrl,
          scopes: scopes,
          configuration: configuration,
          autoRefresh: false,
          useWebPopup: true,
        ));

    log(response.toString());
    return DataSuccess(null);
  }

  Future<DataState> login4() async {
    final configuration = await OpenIdConnect.getConfiguration(
        'https://test.consio.no/OpenIdserver/.well-known/openid-configuration');
    // final configuration = OpenIdConfiguration(
    //     issuer: issuer,
    //     jwksUri: 'https://test.consio.no/OpenIdserver/.well-known/jwks',
    //     authorizationEndpoint: authorizationEndpoint,
    //     tokenEndpoint: tokenEndpoint,
    //     userInfoEndpoint: userInfoEndpoint,
    //     responseTypesSupported: ['id_token', 'token'],
    //     responseModesSupported: ['form_post'],
    //     tokenEndpointAuthMethodsSupported: [],
    //     idTokenSigningAlgValuesSupported: ['RS256'],
    //     subjectTypesSupported: ['public'],
    //     codeChallengeMethodsSupported: ['plain'],
    //     document: {},
    //     requestUriParameterSupported: false);
    final response = await OpenIdConnect.authorizePassword(
      request: PasswordAuthorizationRequest(
        clientId: clientId,
        clientSecret: 'tamtest',
        userName: 'tamtest',
        password: 'tamtest',
        scopes: scopes,
        autoRefresh: false,
        configuration: configuration,
      ),
    );

    log(response.toString());
    return DataSuccess(null);
  }
}
