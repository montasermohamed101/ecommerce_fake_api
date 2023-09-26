import 'package:ecommerce/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = en;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage(); // Call the getLanguage function
  }

  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> getLanguage() async {
    return await storage.read('lang');
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }
    if (typeLang == fr) {
      langLocal = fr;
      saveLanguage(fr);
    } else if (typeLang == ar) {
      langLocal = ar;
      saveLanguage(ar);
    } else {
      langLocal = en;
      saveLanguage(en);
    }
    update();
  }
}
