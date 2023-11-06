import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/domain/models/activity/activity.dart';

abstract class ActivityRepo {
  Future<DataState<List<Activity>>> getData();

  Future<DataState<List<Activity>>> getActivityForWeek(int week);
}
