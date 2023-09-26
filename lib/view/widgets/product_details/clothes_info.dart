import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
   ClothesInfo({
  required this.title,
  required this.productId,
  required this.rate,
  required this.description,
  Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: Get.isDarkMode ? Colors.white : Colors.black
                ),
                ),
              ),
             Obx((){
               return  Container(
                 padding: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   color: Get.isDarkMode ? Colors.white.withOpacity(0.9) : Colors.grey.withOpacity(0.5),
                   shape: BoxShape.circle,
                 ),
                 child: InkWell(
                   onTap: ()
                   {
                     controller.mangeFavorites(productId);
                   },
                   child: controller.isFavorites(productId) ? const Icon(
                     Icons.favorite,
                     color: Colors.red,
                     size: 20,
                   )
                       : const Icon(
                     Icons.favorite_outline,
                     color: Colors.black,
                     size: 20,
                   ),
                 ),
               );
             }),
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: '$rate',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black
              ),
              const SizedBox(width: 5),
              RatingBar(
                initialRating: rate,
                  onRatingUpdate: (value){

                  },
                tapOnlyMode: false,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star,color: Colors.orangeAccent,),
                  half: Icon(Icons.star),
                  empty: Icon(Icons.star)
                ),
                allowHalfRating: true,
              )
            ],
          ),
          const SizedBox(height: 20),
          ReadMoreText(
            description,
            trimLength: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: ' Show More ',
            trimExpandedText: ' Show Less ',
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
