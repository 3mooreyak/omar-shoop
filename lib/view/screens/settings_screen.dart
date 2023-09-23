import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

import '../../logic/controller/theme_controller.dart';
import '../widget/setting/dark_mode_widget.dart';
import '../widget/setting/language_widget.dart';
import '../widget/setting/log_out_widget.dart';
import '../widget/setting/profile_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          ProfileImage(),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: 'GENERAL'.tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
