import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/routes/routes.dart';

class LoginController extends GetxController {
  String user = '';
  String password = '';

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  void fuctionName(dynamic par1, dynamic par2) {
    print('par1: $par1');
    print('par2: $par2');
  }

  void functionName2(dynamic par0, {dynamic par1 = 3, dynamic par2}) {
    print('par1: $par0');
    print('par1: $par1');
    print('par2: $par2');
  }

  void functionName3([dynamic par1, dynamic par2, dynamic par3]) {
    print('par1: $par1');
    print('par2: $par2');
    print('par3: $par3');
  }

  test() {
    print('TEST: fuctionName');
    fuctionName(1, 2);
    print('TEST: name pararameter');
    functionName2(0, par2: 2);
    print('TEST: name list parameter');
    functionName3(1, 2);
  }

  login() {
    if (formKey.currentState?.validate() ?? false) {
      print('Logged in');
      Get.offAllNamed(Routes.home);
    }
  }

  onChangeUser(String p1) {
    user = p1;
  }

  onChangePassword(String p1) {
    password = p1;
  }

  forgot() {}
}
