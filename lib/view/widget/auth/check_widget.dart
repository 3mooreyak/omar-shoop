import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

class CheckWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();
  CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? const Icon(
                            Icons.done,
                            color: pinkClr,
                          )
                        : Image.asset('assets/images/check.png')
                    : Container()),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'I Accept',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none)
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'terms & conditions',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.underline)
            ],
          )
        ],
      );
    });
  }
}
