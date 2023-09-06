import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:omar_apps/view/screens/category_screen.dart';
import 'package:omar_apps/view/screens/favorites_screen.dart';
import 'package:omar_apps/view/screens/home_screen.dart';
import 'package:omar_apps/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    FavoriteScreen(),
    SettingsScreen(),
    CategoryScreen(),
  ].obs;
}
