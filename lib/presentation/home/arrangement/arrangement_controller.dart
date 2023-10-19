import 'package:get/get.dart';
import 'package:widgets/domain/models/arrangement.dart';

class ArrangementController extends GetxController {
  int currentWeek = 1;

  String get timeStr => '16. Jan 2023 - 22. Jan 2023';

  Map<DateTime, List<Arrangement>> formattedData = {};
  //TODO
  void nextWeek() {}

  void prevWeek() {}

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() {
    formattedData = {
      DateTime.now().subtract(Duration(hours: 24)): [],
      DateTime.now(): [
        Arrangement(
            time: DateTime.now(),
            title: 'title',
            content: 'content',
            address: 'address'),
        Arrangement(
            time: DateTime.now().add(Duration(minutes: 10)),
            title: 'title2',
            content: 'content2',
            address: 'address2')
      ],
      DateTime.now().add(Duration(hours: 25)): [
        Arrangement(
            time: DateTime.now(),
            title: 'title3',
            content: 'content3',
            address: 'address3'),
        Arrangement(
            time: DateTime.now().add(Duration(minutes: 10)),
            title: 'title4',
            content: 'content4',
            address: 'address4')
      ]
    };
    update();
  }
}
