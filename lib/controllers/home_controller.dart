import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var appBarTitle = 'Firebase Auth';

  var logOutBtnTxt = 'Sign out';
  var users = FirebaseAuth.instance.currentUser;

}