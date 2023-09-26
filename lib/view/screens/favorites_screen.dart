import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {

  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body: Obx((){
        if(controller.favoritesList.isEmpty) {
        return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,
                width: 100,
                child: Image.asset('assets/images/heart.png'),
              ),
              SizedBox(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Please , Add your favorites products',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        else{
          return  ListView.separated(
              itemBuilder: (context, index) => buildFavItem(
                image: controller.favoritesList[index].image,
                price: controller.favoritesList[index].price,
                title: controller.favoritesList[index].title,
                productId: controller.favoritesList[index].id,
              ),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              itemCount: controller.favoritesList.length
          );
        }
      }),
    );
  }

  buildFavItem({
    required String image,
    required String title,
    required double price,
     required int productId,
}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
              clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(image,
                  fit: BoxFit.cover,
                  ),
                ),
            ),),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$title',style:
                  TextStyle(
                    color:Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ),
                  const SizedBox(height:10),
                  Text('\$${price}',style:
                  TextStyle(
                    color:Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: ()
              {
                controller.mangeFavorites(productId);
              },
              icon: controller.isFavorites(productId) ? const Icon(Icons.favorite,
                color:Colors.red,
              ):
              Icon(Icons.favorite_outline,
                color:Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


