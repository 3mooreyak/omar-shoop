import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/cart_controller.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

import '../../utils/theme.dart';
import '../widget/payment/delivery_container_widget.dart';
import '../widget/payment/payment_method_widget.dart';

class PayMentScreen extends StatelessWidget {
  PayMentScreen({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('PayMent'),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: 'Shipping To',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              SizedBox(
                height: 20,
              ),
              DeliveryContainerWidget(),
              SizedBox(
                height: 20,
              ),
              TextUtils(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                text: 'Payment Method',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              SizedBox(
                height: 20,
              ),
              PaymentMethodWidget(),
              SizedBox(
                height: 30,
              ),
              Center(
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: 'Total : \$${controller.total}',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
