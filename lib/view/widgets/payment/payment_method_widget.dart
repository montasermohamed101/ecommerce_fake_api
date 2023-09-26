import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
            name: 'Paypal',
            image: 'assets/images/paypal.png',
            scale: 0.7,
            value: 1,
            onChanged: (int? value){
              setState(() {
                radioPaymentIndex = value!;
              });
            }
          ),
          const SizedBox(height: 10),
          buildRadioPayment(
              name: 'Google Pay',
              image: 'assets/images/google.png',
              scale: 0.8,
              value: 2,
              onChanged: (int? value){
                setState(() {
                  radioPaymentIndex = value!;
                });
              }
          ),
          const SizedBox(height: 10),
          buildRadioPayment(
              name: 'Credit',
              image: 'assets/images/credit.png',
              scale: 0.8,
              value: 3,
              onChanged: (int? value){
                setState(() {
                  radioPaymentIndex = value!;
                });
              }
          ),
        ],
      ),
    );
  }

  buildRadioPayment({
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
                fit: BoxFit.cover,
                scale: scale,
              ),
              const SizedBox(width: 10),
              TextUtils(
                text: name,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value){
              onChanged(value);
            },
          )
        ],
      ),
    );
  }
}
