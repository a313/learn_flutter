import 'package:get/get.dart';
import 'package:widgets/core/network/api_service.dart';

class ActivityService extends ApiService {
  @override
  String get domain => "https://test.consio.no/";

  Future<Response> getActivity() {
    return getData(endPoint: "MinSideApi/Open/getActivityDemo");
  }

  Future<Response> getActivityForWeek(int week) {
    final params = {'week': week};
    return postData(
      endPoint: "MinSideApi/Open/getActivityForWeek",
      params: params,
    );
  }
}
