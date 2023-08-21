import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var appBarTitle = 'Sign in';

  var userMailController = TextEditingController();
  var userPasswordController = TextEditingController();
  var userFormKey = GlobalKey<FormState>();

  var emailHint = 'Email';
  var passwordHint = 'Password';
  var loginBtnTxt = 'Login';
  var signUpBtnTxt = 'Signup';

  @override
  void dispose() {
    userMailController.dispose();
    userPasswordController.dispose();
    super.dispose();
  }

}