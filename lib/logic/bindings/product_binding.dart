

import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/product_controller.dart';

class ProductBinding extends Bindings{
  void dependencies() {
    Get.put(ProductController());
  }
}