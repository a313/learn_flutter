import 'package:get/get.dart';
import 'package:widgets/domain/models/Melding.dart';
import 'package:widgets/routes/routes.dart';

class MeldingController extends GetxController {
  int currentWeek = 1;

  String get timeStr => '16. Jan 2023 - 22. Jan 2023';

  Map<DateTime, List<Melding>> formattedData = {};
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
      DateTime.now().subtract(Duration(hours: 30)): [
        Melding(
            time: DateTime.now().add(Duration(minutes: 10)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
        Melding(
            time: DateTime.now().add(Duration(hours: 10)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
        Melding(
            time: DateTime.now().add(Duration(hours: 20)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
        Melding(
            time: DateTime.now().add(Duration(hours: 30)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
      ],
      DateTime.now(): [
        Melding(
            time: DateTime.now().add(Duration(minutes: 10)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
        Melding(
            time: DateTime.now().add(Duration(hours: 10)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
        Melding(
            time: DateTime.now().add(Duration(hours: 20)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
        Melding(
            time: DateTime.now().add(Duration(hours: 30)),
            title: 'Vennligst send meg detaljene i databasen som du sa i går',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc gravida ligula quam, quis luctus erat scelerisque nec. Vestibulum eget metus ac urna laoreet fringilla. Sed placerat feugiat turpis, vel accumsan purus sodales sed. Phasellus eget metus eget neque commodo dignissim id eget leo. In nec egestas mi.',
            author: 'Eivind Andresen'),
      ]
    };
    update();
  }

  onOpenDetail(Melding item) {
    Get.toNamed(Routes.meldingDetail, arguments: item);
  }
}
