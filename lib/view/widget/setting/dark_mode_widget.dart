import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/setting_controller.dart';
import 'package:omar_apps/logic/controller/theme_controller.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
              activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
              activeColor: Get.isDarkMode ? pinkClr : mainColor,
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changesTheme();
                controller.switchValue.value = value;
              },
            )
          ],
        ));
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: 'Dark Mode'.tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
