import 'package:get/get.dart';
import 'package:widgets/core/network/api_service.dart';

class NotiService extends ApiService {
  @override
  String get domain => 'https://test.consio.no/';

  Future<Response> saveFcmToken(
      {required int accountId, required String token}) {
    final params = {"actNo": accountId, "token": token};
    return postData(endPoint: 'MinSideApi/Open/saveFcmToken', params: params);
  }
}
