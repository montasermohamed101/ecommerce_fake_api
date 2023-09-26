import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/logic/controllers/category_controller.dart';
import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/product_details_screen.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({
    required this.categoryTitle,
    Key? key
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('${categoryTitle}'),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx((){
        if(categoryController.isAllCategoryLoading.value){
          return  Center(child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),);
        }else{
          return GridView.builder(
            itemCount: categoryController.categoryList.length,
            gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.7,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              return buildCategoryItems(
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  rate: categoryController.categoryList[index].rating.rate,
                  productId: categoryController.categoryList[index].id,
                  productModels: categoryController.categoryList[index],
                  onTab: () {
                    Get.to(() => ProductDetailsScreen(
                      productModels: categoryController.categoryList[index],
                    ));
                  });
            },
          );
        }
      }),
    );
  }

  Widget buildCategoryItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTab,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: onTab,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.mangeFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                );
              }),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      text: '\$$price',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '$rate',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
