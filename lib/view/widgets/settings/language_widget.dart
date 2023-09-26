import 'package:ecommerce/logic/controllers/settings_controller.dart';
import 'package:ecommerce/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);

   final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (_) =>  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: languageSettings),
                child: const Icon(
                  Icons.language_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              TextUtils(
                text: 'Language'.tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color:Get.isDarkMode ? Colors.white : Colors.black,
              width: 2,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(
                Icons.arrow_drop_down_circle_outlined,
                color:Get.isDarkMode ? Colors.white : Colors.black,
              ),
              items:  [
                DropdownMenuItem(
                  child: Text(
                    english,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  value: en,
                ),
                DropdownMenuItem(
                  child: Text(
                    arabic,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  value: ar,
                ),
                DropdownMenuItem(
                  child: Text(
                    france,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  value: fr,
                ),
              ],
              value: controller.langLocal,
              onChanged: (value)
              {
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value));
              },
            ),
          ),
        ),
      ],
    ));
  }
}
