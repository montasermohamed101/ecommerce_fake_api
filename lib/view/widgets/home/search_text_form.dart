import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextForm extends StatelessWidget {

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder:(_) =>  TextField(
      controller: controller.searchController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      onChanged: (searchName){
        controller.addSearchToList(searchName);
      },
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration:  InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: controller.searchController.text.isNotEmpty ?
        IconButton(
          onPressed: ()
          {
            controller.clearSearch();
          },
          icon: const Icon(Icons.close,color: Colors.black,),
        ) : null,
        hintText: 'Search with name & price',
        hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ) );
  }
}
