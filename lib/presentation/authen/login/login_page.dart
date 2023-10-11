import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/util.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';
import 'package:widgets/sharedWidgets/base_textfield.dart';
import 'package:widgets/sharedWidgets/my_button.dart';
import 'package:widgets/theme/app_font.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafold(
        body: Padding(
      padding: padSymHor20,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/png/Logo.png'),
                    sizedBoxH12,
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
                          sizedBoxH12,
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
                          )
                        ],
                      ),
                    ),
                    sizedBoxH20,
                    SizedBox(
                        width: double.infinity,
                        child: MyButton.S2Primary(
                            title: 'Logg inn', onPressed: controller.login)),
                    SizedBox(
                      width: double.infinity,
                      child: MyButton.S2Primary(
                          title: 'Glemt passord', onPressed: controller.forgot),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            'powered by Consio',
            style: AppFonts.Medium14.copyWith(color: context.Primary),
          )
        ],
      ),
    ));
  }
}
