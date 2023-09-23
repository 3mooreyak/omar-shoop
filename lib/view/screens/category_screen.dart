import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

import '../widget/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          top: 15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: TextUtils(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  text: 'Category',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
