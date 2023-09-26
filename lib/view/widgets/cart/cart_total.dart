import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
   CartTotal({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: 'Total',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color:Colors.grey
                ),
                Text('\$${controller.total }',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color:Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                      elevation: 0.0
                  ),
                  onPressed: ()
                  {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Text('Check Out',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
