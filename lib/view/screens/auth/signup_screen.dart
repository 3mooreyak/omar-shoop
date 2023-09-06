import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';
import 'package:omar_apps/routes/routes.dart';
import 'package:omar_apps/utils/my_string.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/screens/auth/login_screen.dart';
import 'package:omar_apps/view/widget/text_utils.dart';
import 'package:get/get.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_text_from_field.dart';
import '../../widget/auth/check_widget.dart';
import '../../widget/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'SIGN',
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none),
                          SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'UP',
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none)
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFromField(
                        controller: nameController,
                        obscureText: false,
                        validator: (Value) {
                          if (Value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(Value)) {
                            return 'Enter valid name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assets/images/user.png')
                            : Icon(
                                Icons.person,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: Text(''),
                        hintText: 'User Name ',
                      ),
                      const SizedBox(
                        height: 20,
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
                            ? Image.asset('assets/images/email.png')
                            : Icon(
                                Icons.email,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: Text(''),
                        hintText: 'Email ',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (Value) {
                              if (Value.toString().length < 6) {
                                return 'password should be longer or equal to 6 chractars';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )),
                            hintText: 'Password ',
                          );
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPressed: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar('Check Box',
                                  'Please, Accept terms & conditions',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white);
                            } else if (fromKey.currentState!.validate()) {
                              String name = nameController.text.trim();
                              String email = emailController.text.trim();
                              String password = passwordController.text;

                              controller.SignUpUsingFirebase(
                                name: name,
                                email: email,
                                password: password,
                              );
                              controller.isCheckBox = true;
                            }
                          },
                          text: 'SIGN UP',
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
              text: 'Already have an Account ?   ',
              textType: 'Log In',
            )
          ],
        )),
      ),
    );
  }
}
