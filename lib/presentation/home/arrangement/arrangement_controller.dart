import 'package:get/get.dart';
import 'package:widgets/domain/models/arrangement.dart';

class ArrangementController extends GetxController {
  int currentWeek = 1;

  String get timeStr => '16. Jan 2023 - 22. Jan 2023';

  Map<DateTime, List<Arrangement>> formattedData = {};
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

  void getData(int week) {
    formattedData = {
      DateTime.now().subtract(Duration(hours: 24)): [],
      DateTime.now(): [
        Arrangement(
            time: DateTime.now(),
            title: 'title $week',
            content: 'content',
            address: 'address'),
        Arrangement(
            time: DateTime.now().add(Duration(minutes: 10)),
            title: 'title $week',
            content: 'content2',
            address: 'address2')
      ],
      DateTime.now().add(Duration(hours: 25)): [
        Arrangement(
            time: DateTime.now(),
            title: 'title $week',
            content: 'content3',
            address: 'address3'),
        Arrangement(
            time: DateTime.now().add(Duration(minutes: 10)),
            title: 'title $week',
            content: 'content4',
            address: 'address4')
      ]
    };
    update();
  }
}
