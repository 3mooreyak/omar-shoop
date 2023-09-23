import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/cart_controller.dart';
import 'package:omar_apps/logic/controller/category_controller.dart';
import 'package:omar_apps/logic/controller/product_controller.dart';

class ProductBinding extends Bindings {
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
