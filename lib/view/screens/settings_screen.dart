import 'package:ecommerce/logic/controllers/auth_controller.dart';
import 'package:ecommerce/logic/controllers/theme_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/settings/language_widget.dart';
import 'package:ecommerce/view/widgets/settings/logout_widget.dart';
import 'package:ecommerce/view/widgets/settings/profile_widget.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/settings/dark_mode_widget.dart';

class SettingsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
     body: ListView(
       padding: const EdgeInsets.all(20),
       children:  [
         ProfileWidget(),
         const SizedBox(height: 10),
         Divider(
           color: Get.isDarkMode ? Colors.white : Colors.grey,
           thickness: 2,
         ),
         const SizedBox(height: 20),
         TextUtils(
             text: 'GENERAL'.tr,
             fontSize: 18,
             fontWeight: FontWeight.bold,
             color: Get.isDarkMode ? pinkClr : mainColor,
         ),
         const SizedBox(height: 20),
         DarkModeWidget(),
         const SizedBox(height: 20),
         LanguageWidget(),
         const SizedBox(height: 20),
         LogOutWidget(),

       ],
     ),
    );
  }
}

