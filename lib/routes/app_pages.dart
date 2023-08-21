import 'package:authentication_app/views/home_screen.dart';
import 'package:get/get.dart';

import '../views/login_screen.dart';
import 'app_routes.dart';

class AppPages{
  static var lists = [
    GetPage(name: AppRoutes.login, page: () => LoginScreen(),),
    // GetPage(name: AppRoutes.home, page: () => HomeScreen(),),
  ];
}