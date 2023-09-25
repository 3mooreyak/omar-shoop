import 'package:flutter/material.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buidRadioPayment(
              name: 'paypal',
              image: 'assets/images/paypal.png',
              scale: 0.7,
              value: 1,
              onChanged: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          SizedBox(
            height: 15,
          ),
          buidRadioPayment(
              name: 'Google Pay',
              image: 'assets/images/google.png',
              scale: 0.8,
              value: 2,
              onChanged: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          SizedBox(
            height: 15,
          ),
          buidRadioPayment(
              name: 'Credit Card',
              image: 'assets/images/credit.png',
              scale: 0.7,
              value: 3,
              onChanged: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
        ],
      ),
    );
  }

  Widget buidRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChanged,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            groupValue: radioPaymentIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
          )
        ],
      ),
    );
  }
}
