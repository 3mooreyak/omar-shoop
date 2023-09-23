import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
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
              cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
              textConfirm: ' YES ',
              confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? Colors.black : Colors.white,
            );
          },
          splashColor: Get.isDarkMode ? pinkClr : mainColor,
          borderRadius: BorderRadius.circular(12),
          customBorder: StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextUtils(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                text: 'Log Out'.tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
