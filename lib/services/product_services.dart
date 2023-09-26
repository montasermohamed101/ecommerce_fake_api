import 'dart:convert';

import 'package:ecommerce/utils/my_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/products_model.dart';

class ProductServices  {

  //Future<List<ProductModels>>
 static Future<List<ProductModels>>  getProduct()async{
    // await http.get(Uri.parse('$baseUrl/products'));
    var url = Uri.parse('$baseUrl/products');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
         //var jsonData = jsonDecode(response.body);
       var jsonData = response.body;
        return productModelsFromJson(jsonData);

    }else{
      return throw Exception('Faild To Load Product');
    }

  }

}