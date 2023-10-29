import 'package:get/get.dart';
import 'package:widgets/core/network/api_service.dart';

class ActorService extends ApiService {
  @override
  String get domain => 'https://test.consio.no/';

  Future<Response> getActor() {
    return getData(endPoint: 'MinSideApi/Open/Actor');
  }

  Future<Response> getActorAddress() {
    return getData(endPoint: 'MinSideApi/Open/ActorAddresses');
  }
}
