import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/view/screens/auth/forgot_password_screen.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_text_from_field.dart';
import '../../widget/auth/check_widget.dart';
import '../../widget/auth/container_under.dart';
import '../../widget/text_utils.dart';

class LoginScreen extends StatelessWidget {
  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  LoginScreen({super.key});

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
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: fromKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'LOG',
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none),
                          SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'IN',
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none)
                        ],
                      ),
                      const SizedBox(
                        height: 50,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPsswordScreen);
                            },
                            child: TextUtils(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                text: 'Forgot Password?',
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                underLine: TextDecoration.none)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      AuthButton(
                        onPressed: () {},
                        text: 'LOG IN ',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          text: 'OR',
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underLine: TextDecoration.none),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset('assets/images/facebook.png')),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset('assets/images/google.png')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.signUpScreen);
              },
              text: 'Dont have an account ?   ',
              textType: 'Sign Up',
            )
          ],
        )),
      ),
    );
  }
}
