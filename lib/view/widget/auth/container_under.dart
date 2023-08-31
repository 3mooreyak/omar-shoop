import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder(
      {required this.textType,
      required this.onPressed,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : pinkClr,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              text: text,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: textType,
                color: Colors.white,
                underLine: TextDecoration.none),
          )
        ],
      ),
    );
  }
}
