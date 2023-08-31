

import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
  }


}