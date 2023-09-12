import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';
import 'package:omar_apps/utils/theme.dart';

import '../../logic/controller/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ThemeController().changesTheme();
            },
            child: Text(
              'Dark Mode',
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GetBuilder<AuthController>(
            builder: (controller) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Log Out From App',
                    titleStyle: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                    middleText: 'Are You Sure You Need To Log Out',
                    middleTextStyle: TextStyle(
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                    radius: 10,
                    textCancel: ' NO ',
                    cancelTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    textConfirm: ' YES ',
                    confirmTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? Colors.black : Colors.white,
                  );
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
