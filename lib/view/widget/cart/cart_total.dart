import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/cart_controller.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

import '../../../routes/routes.dart';
import '../../../utils/theme.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                TextUtils(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  text: 'Total',
                  color: Colors.grey,
                  underLine: TextDecoration.none,
                ),
                Text(
                  '\$${controller.total}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor),
                  onPressed: () {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Check Out',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
