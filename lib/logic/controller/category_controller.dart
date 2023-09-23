import 'package:get/get.dart';
import 'package:omar_apps/model/product_models.dart';
import 'package:omar_apps/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;
  var categoryList = <ProductModels>[].obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategorys(String nameCategory) async {
    isAllCategory(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
