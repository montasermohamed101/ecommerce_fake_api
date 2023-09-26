import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  AddCart({
    required this.productModels,
    required this.price,
    Key? key
  }) : super(key: key);

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Price',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              Text('$price',style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),),
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
                  elevation: 0.0,
                  primary: Get.isDarkMode ? pinkClr :  mainColor
                ),
                  onPressed: ()
                  {
                    controller.addProductToCart(productModels);
                  },
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Text('Add To Cart',style: TextStyle(
                        color: Colors.white ,
                        fontSize: 20,
                        height: 1.5,
                      ),),
                      SizedBox(width: 10),
                      Icon(Icons.shopping_cart_outlined),
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
