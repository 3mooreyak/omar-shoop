import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';
import 'package:omar_apps/logic/controller/payment_controller.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

import '../../../routes/routes.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();
  int radioContinerIndex = 1;
  bool changeColors = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
          address: 'riyadh  alrimal  tnal',
          name: 'omar khalil',
          phone: '0564105043',
          title: 'omar shop',
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value) {
            setState(
              () {
                radioContinerIndex = value!;
                changeColors = !changeColors;
              },
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContiner(
            address: 'alahsaa  almazroo  mothalth',
            name: authController.displayUserName.value,
            phone: controller.phoneNumber.value,
            title: 'omar home',
            value: 2,
            color: changeColors ? Colors.grey.shade300 : Colors.white,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: 'Enter Your Phone Number',
                  titleStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  radius: 10,
                  textCancel: ' Cancel ',
                  confirmTextColor: Colors.black,
                  textConfirm: ' Save ',
                  cancelTextColor: Colors.black,
                  onCancel: () {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  onConfirm: () {
                    Get.back();
                    controller.phoneNumber.value = phoneController.text;
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  content: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      controller: phoneController,
                      maxLength: 10,
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) {
                        phoneController.text = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Get.isDarkMode
                            ? pinkClr.withOpacity(0.2)
                            : mainColor.withOpacity(0.4),
                        focusColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              phoneController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            )),
                        hintText: 'Enter Your Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.contact_phone,
                size: 20,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            ),
            onChanged: (int? value) {
              setState(
                () {
                  radioContinerIndex = value!;
                  changeColors = !changeColors;
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildRadioContiner({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String address,
    required String phone,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContinerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: title,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: name,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '🇸🇦+966 ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    TextUtils(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      text: phone,
                      color: Colors.black,
                      underLine: TextDecoration.none,
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: address,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
