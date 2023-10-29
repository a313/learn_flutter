import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

extension ResponseExtension on Response {
  void logToConsole({String name = 'API', dynamic params}) {
    final method = request?.method;
    final fullUrl = request?.url;
    final header = headers;

    if (!kDebugMode) return;

    try {
      log("Header => $header", name: name);
      log("Method.$method Url:$fullUrl Params: $params", name: name);
      log("Response => $bodyString", name: name);
    } catch (e) {
      log(toString(), name: "API");
    }
  }

  bool get isServerError {
    return statusCode != null && statusCode! >= 500 && statusCode! < 600;
  }
}

class ApiService extends GetConnect {
  String get domain {
    throw UnimplementedError();
  }

  Future<Response> getData(
      {required String endPoint, Map<String, String?>? params}) async {
    final header = buildHeader();
    final response =
        await get(domain + endPoint, headers: header, query: params);
    response.logToConsole();
    return response;
  }

  Future<Response> postData({required String endPoint, dynamic params}) async {
    final response = await post(domain + endPoint, params);
    response.logToConsole(params: params);
    return response;
  }

  Future<Response> putData({required String endPoint, dynamic params}) async {
    final response = await put(domain + endPoint, params);
    response.logToConsole(params: params);
    return response;
  }

  Future<Response> deleteData(
      {required String endPoint, Map<String, String>? params}) async {
    final response = await delete(domain + endPoint, query: params);
    response.logToConsole(params: params);
    return response;
  }

  buildHeader() {
    return null;
  }
}
