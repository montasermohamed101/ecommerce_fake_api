import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
          ),
          const SizedBox(height: 40),
          RichText(
              text: TextSpan(
            children:[
              TextSpan(
              text: 'Your Cart is ',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
              TextSpan(
              text: 'Empty ',
              style: TextStyle(
                color: Get.isDarkMode ? pinkClr : mainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ],
          )
          ),
          const SizedBox(height: 10),
          Text('Add items To Get Started',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height:50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(shape:  BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0.0,
              primary: Get.isDarkMode ? pinkClr : mainColor,
            ),
            onPressed: ()
              {
                Get.toNamed(Routes.mainScreen);
              },
              child: const Text('Go To Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              ),
          ),
        ],
      ),
    );
  }
}
