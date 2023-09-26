import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Row(
        children: [
          InkWell(
            onTap: ()
            {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child:controller.isCheck ? Get.isDarkMode
                  ?  Image.asset('assets/images/check.png')
                  : Icon(Icons.done,color: pinkClr,) :

              Container()

            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              TextUtils(
                text: 'I Accept ',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color:  Get.isDarkMode ? Colors.white : Colors.black,
              ),
              TextUtils(
                text: 'terms & conditions',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.underline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
