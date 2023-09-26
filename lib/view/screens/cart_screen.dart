import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Card Items'),
          elevation: 0.0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx((){
          if(controller.productsMap.isEmpty) {
            return EmptyCard();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: ListView.separated(
                    itemBuilder: (context, index) => CartProductCard(
                      productModels: controller.productsMap.keys.toList()[index],
                      index: index,
                      quantity: controller.productsMap.values.toList()[index],
                    ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                    itemCount: controller.productsMap.length,
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CartTotal(),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
