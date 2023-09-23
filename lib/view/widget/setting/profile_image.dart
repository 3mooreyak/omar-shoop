import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';
import 'package:omar_apps/logic/controller/setting_controller.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  text: controller
                      .capitalize(authController.displayUserName.value),
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                TextUtils(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: authController.displayUserEmail.value,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
