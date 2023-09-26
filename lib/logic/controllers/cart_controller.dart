import 'package:ecommerce/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/theme.dart';

class CartController extends GetxController {

  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels){
    if(productsMap.containsKey(productModels)){
      productsMap[productModels] += 1;
    }else{
      productsMap[productModels] = 1;
     // print(productsMap.entries.map((e) => e.key.price * e.value).toList());

    }
  }

  void removeProductsFromCart(ProductModels productModels){
    if(productsMap.containsKey(productModels)&& productsMap[productModels] == 1){
      productsMap.removeWhere((key, value) => key == productModels);
    }else{
      productsMap[productModels] -= 1;
    }
    Get.snackbar('Success', 'Item Removed}',
    snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.indigo,
      colorText: Colors.white,
    );
  }

  void removeOneProduct(ProductModels productModels){
    productsMap.removeWhere((key, value) => key == productModels);

  }

  void clearAllProducts(){
    Get.defaultDialog(
      title: 'Logout From App',
      titleStyle: TextStyle(
        fontSize: 18,
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need to clear all products?',
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
        Get.toNamed(Routes.cartScreen) ;
      },
      onConfirm: (){
        productsMap.clear();
        Get.back();
      },
      buttonColor: mainColor,
    );

  }

  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries.map((e) => e.key.price * e.value).toList()
      .reduce((value, element) => value + element).toStringAsFixed(2);


  int quantity (){
    if(productsMap.isEmpty){
      return 0;
    }
    return productsMap.entries.map((e) => e.value).toList()
        .reduce((value, element) => value + element);
  }



}
