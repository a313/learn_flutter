import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';
import 'package:widgets/sharedWidgets/base_textfield.dart';
import 'package:widgets/sharedWidgets/my_button.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Login',
        body: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    BaseTextField(
                      labelText: 'User',
                      controller: controller.userController,
                      onChanged: controller.onChangeUser,
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return 'User lenght not valid';
                        }
                        return null;
                      },
                    ),
                    BaseTextField(
                      labelText: 'Password',
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
              MyButton.primary(title: 'Login', onPressed: controller.login)
            ],
          ),
        ));
  }
}
