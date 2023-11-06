import 'package:widgets/data/datasource/noti_service.dart';
import 'package:widgets/domain/repo_abs/noti_repo_abs.dart';

import '../../core/usecase/data_state.dart';

class NotiRepoImpl extends NotiRepo {
  final NotiService _;
  NotiRepoImpl(this._);

  @override
  Future<DataState> saveFcmToken(
      {required int accountId, required String token}) async {
    final response = await _.saveFcmToken(accountId: accountId, token: token);
    if (response.statusCode == 200) {
      return DataSuccess(null);
    } else {
      return IgnoreState();
    }
  }
}
