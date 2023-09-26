import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) => Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: ()
        {
          Get.defaultDialog(
            title: 'Logout From App',
            titleStyle: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Are you sure you need to logut?',
            middleTextStyle: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            radius: 10,
            textCancel: 'No',
            cancelTextColor:  Get.isDarkMode ? Colors.white : Colors.black,
            textConfirm: 'Yes',
            confirmTextColor:  Get.isDarkMode ? Colors.white : Colors.black,
            onCancel: (){
              Get.back();
            },
            onConfirm: (){
              controller.signOut();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        splashColor: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: BorderRadius.circular(15),
        customBorder: const StadiumBorder(),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: logOutSettings),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            TextUtils(
              text: 'Logout'.tr,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    ));
  }
}
