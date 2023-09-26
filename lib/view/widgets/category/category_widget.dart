import 'package:ecommerce/logic/controllers/category_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/category/category_items.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
     if(controller.isCategoryLoading.value){
       return Center(child: CircularProgressIndicator(
         color: Get.isDarkMode ? pinkClr : mainColor,
       ));
     }else{
       return Expanded(
         child: ListView.separated(
           itemBuilder: (context,index) => InkWell(
             onTap: () {
             // controller.getAllCategorys(controller.categoryNameList[index]);
             controller.getCategoryIndex(index);
               Get.to(()=>CategoryItems(
                 categoryTitle: controller.categoryNameList[index],
               ));
             },
             child: Container(
               height: 150,
               width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15),
                 image: DecorationImage(image: NetworkImage('${controller.imageCategory[index]}')
                     ,fit: BoxFit.cover),
               ),
               child:  Padding(padding: EdgeInsets.only(left: 20,bottom: 10),
                 child: Align(
                   alignment: Alignment.bottomLeft,
                   child: Text('${controller.categoryNameList[index]}',
                     style: const TextStyle(
                       backgroundColor: Colors.black26,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 22,
                     ),
                   ),
                 ),
               ),
             ),
           ),
           separatorBuilder: (context,index) => const SizedBox(height: 20),
           itemCount: controller.categoryNameList.length,
         ),
       );
     }
    });
  }
}
