import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/cart_controller.dart';
import 'package:omar_apps/logic/controller/main_controller.dart';
import 'package:omar_apps/routes/routes.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: [
            Obx(
              () => badges.Badge(
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: badges.BadgeAnimation.slide(
                  animationDuration: Duration(milliseconds: 300),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  icon: Image.asset(
                    'assets/images/shop.png',
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          title: Text(
            controller.title[controller.currentIndex.value],
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
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
