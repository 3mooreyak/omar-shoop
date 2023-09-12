import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Text(
          'HomeScreen',
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
