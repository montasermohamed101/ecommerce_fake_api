import 'package:ecommerce/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/products_model.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>('isFavorites');

    if (storedShoppings != null) {
      favoritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading.value = true;
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Logic for  Favorites Screen

  void mangeFavorites(int productId) async {
    //هنا هعمل حاجه اسمها indexWhere علشان اعرف رقم الindex جوه الليست
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex); //هنا انا بمسح الitem
      //await storage.remove('isFavorites');// علشان امسح القيمة من الميمورى
      await storage.write(
          'isFavorites', favoritesList); // علشان امسح القيمة من الميمورى

    } else {
      // هنا علشان ابحث عن ال id بتاع الproduct واضيفه فى الليست
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));
      //هنا بضيف الحاجه فى الميمورى علشان لو قفلت البرنامج وفتحت الاقيه
      await storage.write('isFavorites', favoritesList);
    }
  }

  bool isFavorites(int productId) {
    //هنا  انا برجع الليست على اى حاجه = id
    return favoritesList.any((element) => element.id == productId);
  }

  //Search Bar Logic

  void addSearchToList(String searchName) {

    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.contains(searchName);
    }).toList();
    update();
  }

  void clearSearch(){
    searchController.clear();
    addSearchToList('');
  }


}
