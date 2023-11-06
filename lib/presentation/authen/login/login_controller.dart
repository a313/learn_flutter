import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widgets/core/extensions/datetime_ext.dart';
import 'package:widgets/domain/usecases/fcm_usecase.dart';
import 'package:widgets/routes/routes.dart';

class LoginController extends GetxController {
  String user = '';
  String password = '';

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  final notiUsecase = Get.find<FcmUsecase>();

  login() {
    if (formKey.currentState?.validate() ?? false) {
      print('Logged in');
      //TODO
      notiUsecase.sendFcmToken(0);
      Get.offAllNamed(Routes.home);
    }
  }

  onChangeUser(String p1) {
    user = p1;
  }

  onChangePassword(String p1) {
    password = p1;
  }

  forgot() {
    final date = DateTime(2023, 2, 11);
    var week = date.weekOfYear;

    DateFormat format = DateFormat('ww');

    String weekNumber = format.format(date);
    print(week);
    print(weekNumber);
  }
}
