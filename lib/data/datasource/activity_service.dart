import 'package:get/get.dart';
import 'package:widgets/core/network/api_service.dart';

class ActivityService extends ApiService {
  @override
  // TODO: implement domain
  String get domain => "https://test.consio.no/";

  Future<Response> getActivity() {
    return getData(endPoint: "MinSideApi/Open/getActivityDemo");
  }
}
