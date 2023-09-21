import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/cart_controller.dart';
import 'package:omar_apps/model/product_models.dart';
import 'package:omar_apps/utils/theme.dart';

import '../widget/cart/cart_product_card.dart';
import '../widget/cart/cart_total.dart';
import '../widget/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text('Cart Items'),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.ClearAllProducts();
              },
              icon: Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return EmptyCart();
            } else
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            quantity:
                                controller.productsMap.values.toList()[index],
                            index: index,
                            productModels:
                                controller.productsMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    )
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
