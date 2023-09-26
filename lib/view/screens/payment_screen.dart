import 'package:ecommerce/view/widgets/payment/delivery_container_widget.dart';
import 'package:ecommerce/view/widgets/payment/payment_method_widget.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        elevation: 0.0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Shipping to',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 10),
              DeliveryContainerWidget(),
              const SizedBox(height: 10),
              TextUtils(
                text: 'Payment Method',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 10),
              const PaymentMethodWidget(),
              const SizedBox(height: 10),
              Center(
                child: TextUtils(
                  text: 'Total : \$200',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0.0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
