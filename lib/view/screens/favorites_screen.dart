import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Text(
          'FavoriteScreen',
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
