import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/data/datasource/activity_service.dart';
import 'package:widgets/domain/models/activity/activity.dart';
import 'package:widgets/domain/repo_abs/activity_repo_abs.dart';

class ActivityRepoImpl extends ActivityRepo{
  final ActivityService _;
  ActivityRepoImpl(this._);

  @override
  Future<DataState<List<Activity>>> getData() async{
    final response = await _.getActivity();
    if (response.statusCode == 200) {
      final data = Activity.getList(response.body);
      return DataSuccess(data);
    } else {
      return DataFailure(
          response.statusCode!, response.bodyString ?? 'UNKNOWN ERROR');
    }
  }

}