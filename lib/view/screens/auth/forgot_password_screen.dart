import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/auth/auth_button.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../widget/auth/auth_text_from_field.dart';

class ForgotPsswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();
  ForgotPsswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(color: Get.isDarkMode ? pinkClr : mainColor),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'if you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFromField(
                    controller: emailController,
                    obscureText: false,
                    validator: (Value) {
                      if (!RegExp(validationEmail).hasMatch(Value)) {
                        return 'envaild email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          )
                        : Image.asset('assets/images/email.png'),
                    suffixIcon: Text(''),
                    hintText: 'Email ',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                            String email = emailController.text.trim();
                            controller.resetPassword(email);
                          }
                        },
                        text: 'SEND');
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
