import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  var categoryNameList = <String>[].obs;
  
  var categoryList = <ProductModels>[].obs;

  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;

  List<String> imageCategory = [
    'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg',
    'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
    'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
    'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg',


  ];

  @override
  void onInit() {
    // TODO: implement onInit
    getCategorys();
    super.onInit();
  }


  void getCategorys()async{
    var categoryName = await CategoryServices.getCategory();

    try{
      isCategoryLoading(true);
      if(categoryName.isNotEmpty){
        categoryNameList.addAll(categoryName);
      }
    }finally{
      isCategoryLoading(false);
    }
  }  
  
   getAllCategorys(String nameCategory)async{
    isAllCategoryLoading(true);
    categoryList.value =   await AllCategoryServices.getAllCategory(nameCategory);

      isAllCategoryLoading(false);


  }
  getCategoryIndex(int index)async{
    var categoryAllName = await  getAllCategorys(categoryNameList[index]);
    if(categoryAllName != null){
      categoryList.value = categoryAllName;
    }
  }
}