import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels ;
  final int index;
  final int quantity;
   CartProductCard({
     required this.productModels,
     required this.index,
     required this.quantity,
     Key? key
   }) : super(key: key);

   final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.9)
            : mainColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(productModels.image),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productModels.title}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Text(
                  '\$${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFromCart(productModels);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                   Text(
                    '$quantity',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
