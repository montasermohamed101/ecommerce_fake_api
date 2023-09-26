import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screens/product_details_screen.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value){
        return  Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          )),
        );
      }else{
        return Expanded(
          child: controller.searchList.isEmpty  && controller.searchController.text.isNotEmpty
              ?Get.isDarkMode ? Image.asset('assets/images/search_empty_dark.png') : Image.asset('assets/images/search_empty_light.png')
              : GridView.builder(
            itemCount: controller.searchList.isEmpty ? controller.productList.length : controller.searchList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.7,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 300,

            ),
            itemBuilder: (context,index){
              if(controller.searchList.isEmpty){
                return buildCardItems(
                  title: controller.productList[index].title,
                    image: controller.productList[index].image,
                    price: controller.productList[index].price,
                    rate: controller.productList[index].rating.rate,
                    productId: controller.productList[index].id,
                    productModels: controller.productList[index],
                    onTab: (){
                      Get.to(() =>  ProductDetailsScreen(
                        productModels: controller.productList[index],
                      ));
                    }
                );
              }else{
                return buildCardItems(
                    title: controller.productList[index].title,
                    image: controller.searchList[index].image,
                    price: controller.searchList[index].price,
                    rate: controller.searchList[index].rating.rate,
                    productId: controller.searchList[index].id,
                    productModels: controller.searchList[index],
                    onTab: (){
                      Get.to(() =>  ProductDetailsScreen(
                        productModels: controller.searchList[index],
                      ));
                    }
                );
              }

            },
          ),
        );
      }

    });
  }

  Widget buildCardItems({
  required String image,
  required String title,
  required double price,
  required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTab,
}) {
    return Padding(padding: const EdgeInsets.all(20),
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
              Obx((){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: ()
                      {
                        controller.mangeFavorites(productId);
                      },
                      icon: controller.isFavorites(productId) ? const Icon(Icons.favorite,
                      color:Colors.red,
                      ):
                        Icon(Icons.favorite_outline,
                          color:Get.isDarkMode ? Colors.blue : Colors.black,
                        ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                        cartController.addProductToCart(productModels);
                      },
                      icon:  Icon(Icons.shopping_cart,
                        color:Get.isDarkMode ? Colors.blue : Colors.black,
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
                child: Image.network(image,
                fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                   TextUtils(
                       text: '\$$price',
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color:Colors.black,
                   ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 3,right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '$rate',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            const Icon(Icons.star,size: 14,color: Colors.white,),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:    Text(
                    "${title}",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color:Get.isDarkMode ? Colors.blue : Colors.black,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
