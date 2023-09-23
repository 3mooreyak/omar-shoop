import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/cart_controller.dart';
import 'package:omar_apps/model/product_models.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  AddCart({
    required this.price,
    required this.productModels,
    super.key,
  });

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: 'Price',
                color: Colors.grey,
                underLine: TextDecoration.none,
              ),
              Text(
                '\$$price',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              )
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
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onPressed: () {
                  controller.AddProductToCart(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
