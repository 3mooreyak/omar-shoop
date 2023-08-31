import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:omar_apps/logic/bindings/auth_binding.dart';
import 'package:omar_apps/view/screens/auth/forgot_password_screen.dart';
import 'package:omar_apps/view/screens/auth/login_screen.dart';
import 'package:omar_apps/view/screens/auth/signup_screen.dart';

import '../view/screens/welcome_screen.dart';

class AppRoutes {
//intialRoutes
  static const welcome = Routes.welcomeScreen;

//getPage
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPsswordScreen,
      page: () => ForgotPsswordScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPsswordScreen = '/forgotPsswordScreen';
}
