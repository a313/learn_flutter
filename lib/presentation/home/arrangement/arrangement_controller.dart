import 'package:get/get.dart';
import 'package:widgets/core/extensions/datetime_ext.dart';
import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/domain/models/activity/activity.dart';
import 'package:widgets/domain/usecases/activity_usecase.dart';

class ArrangementController extends GetxController {
  int currentWeek = 1;
  final usesases = Get.find<ActivityUsecases>();
  String get timeStr => '16. Jan 2023 - 22. Jan 2023';

  Map<DateTime, List<Activity>> formattedData = {};
  //TODO
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final date = DateTime.now();
    currentWeek = ((365 - date.weekday + 10) / 7).floor();
    currentWeek = 30;
  }

  @override
  void onReady() {
    super.onReady();
    getData(currentWeek);
  }

  void nextWeek() {
    if (currentWeek <= 51) currentWeek += 1;
    getData(currentWeek);
  }

  void prevWeek() {
    if (currentWeek >= 1) currentWeek -= 1;
    getData(currentWeek);
  }

  Future<void> getData(int week) async {
    //TODO Get data by week
    final response = await usesases.getData();
    if (response is DataSuccess<List<Activity>>) {
      var list = response.data;
      formatData(list);
    } else {}
    formattedData = {};
  }

  void formatData(List<Activity> list) {
    formattedData.clear();
    for (var act in list) {
      final startDate = act.activityStartDate ?? DateTime.now();
      final day = startDate.dateWithoutTime;
      if (formattedData.containsKey(day)) {
        formattedData[day]!.add(act);
      } else {
        formattedData[day] = [act];
      }
    }

    update();
  }
}
