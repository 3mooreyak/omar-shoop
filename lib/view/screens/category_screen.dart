import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Text(
          'CategoryScreen',
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
