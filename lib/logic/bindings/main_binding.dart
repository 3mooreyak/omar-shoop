import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/auth_controller.dart';
import 'package:omar_apps/logic/controller/main_controller.dart';

import '../controller/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }
}
