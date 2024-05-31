import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widgets/core/extensions/datetime_ext.dart';
import 'package:widgets/data/repo_impl/auth_repo_impl.dart';
import 'package:widgets/domain/usecases/fcm_usecase.dart';
import 'package:widgets/routes/routes.dart';

class LoginController extends GetxController {
  String user = 'tamtest';
  String password = 'tamtest';

  late TextEditingController userController, passwordController;

  GlobalKey<FormState> formKey = GlobalKey();

  final notiUsecase = Get.find<FcmUsecase>();

  @override
  void onInit() {
    userController = TextEditingController(text: user);
    passwordController = TextEditingController(text: password);
    super.onInit();
  }

  login1() async {
    final result = await AuthRepoImpl().login();
    print(result);
  }

  login2() async {
    final result = await AuthRepoImpl().login2();
    print(result);
  }

  login3() async {
    final result = await AuthRepoImpl().login3();
    print(result);
  }

  login4() async {
    final result = await AuthRepoImpl().login4();
    print(result);
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

  login5() async {
    final token = await Get.toNamed(Routes.openId);
    log(token);
    if (token != null) {
      Get.offAllNamed(Routes.home);
    }
  }
}
