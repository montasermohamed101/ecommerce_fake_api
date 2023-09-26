import 'package:ecommerce/utils/my_string.dart';
import 'package:http/http.dart' as http;
import '../model/category_model.dart';
import '../model/products_model.dart';

class CategoryServices  {
  static Future<List<String>>  getCategory()async{
    var url = Uri.parse('$baseUrl/products/categories');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);

    }else{
      return throw Exception('Faild To Load Product');
    }

  }
}

class AllCategoryServices  {
  static Future<List<ProductModels>>  getAllCategory(String categoryName)async{
    var url = Uri.parse('$baseUrl/products/category/$categoryName');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      var jsonData = response.body;
      return productModelsFromJson(jsonData);

    }else{
      return throw Exception('Faild To Load Product');
    }

  }

}