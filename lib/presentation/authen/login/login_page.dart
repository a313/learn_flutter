import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';
import 'package:widgets/sharedWidgets/base_textfield.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Login',
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      BaseLabelTextField(
                        label: 'Brukernavn',
                        controller: controller.userController,
                        onChanged: controller.onChangeUser,
                        validator: (value) {
                          if (value != null && value.length < 4) {
                            return 'User lenght not valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      BaseLabelTextField(
                        label: 'Passord',
                        obscureText: true,
                        controller: controller.passwordController,
                        onChanged: controller.onChangePassword,
                        validator: (value) {
                          if (value != null && value.length < 4) {
                            return 'Password not valid';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                // MyButton.primary(title: 'Login', onPressed: controller.login)
              ],
            ),
          ),
        ));
  }
}
