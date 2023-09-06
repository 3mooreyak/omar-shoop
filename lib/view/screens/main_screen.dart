import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/main_controller.dart';
import 'package:omar_apps/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/shop.png',
                ))
          ],
          backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
          title: Text(
            'Asroo Shop',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value),
      );
    }));
  }
}
