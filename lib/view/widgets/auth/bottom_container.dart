import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;

  BottomContainer({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.textType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
        color: Get.isDarkMode ?  mainColor : pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: textType,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
