import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/domain/models/activity/activity.dart';
import 'package:widgets/domain/repo_abs/activity_repo_abs.dart';

class ActivityUsecases {
  final ActivityRepo _;
  ActivityUsecases(this._);
  Future<DataState<List<Activity>>> getData() {
    return _.getData();
  }
}
