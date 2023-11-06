import 'package:widgets/core/usecase/data_state.dart';

abstract class NotiRepo {
  Future<DataState> saveFcmToken(
      {required int accountId, required String token});
}
