import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/model/product_models.dart';
import 'package:omar_apps/routes/routes.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void AddProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void RemoveProductsFarmCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void RemoveOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void ClearAllProducts() {
    Get.defaultDialog(
      title: 'Clear All Products',
      titleStyle: TextStyle(
          fontSize: 18,
          color: Get.isDarkMode ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold),
      middleText: 'Are You Sure You Need To Clear All Products',
      middleTextStyle: TextStyle(
          fontSize: 18,
          color: Get.isDarkMode ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold),
      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
      radius: 10,
      textCancel: ' NO ',
      cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      textConfirm: ' YES ',
      confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? Colors.black : Colors.white,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    return productsMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
  }
}
