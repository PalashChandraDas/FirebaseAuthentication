import 'package:authentication_app/controllers/home_controller.dart';
import 'package:authentication_app/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class MyDI extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
  }

}