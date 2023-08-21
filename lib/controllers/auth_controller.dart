import 'package:authentication_app/views/home_screen.dart';
import 'package:authentication_app/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    
    ever(_user, _initialScreen);

  }

  _initialScreen(User? user){
    if(user == null){
      print('login screen');
      Get.offAll(()=> LoginScreen());
    } else {
      Get.offAll(()=>HomeScreen(email: user.email!,));
    }
  }

  void register(String email, password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e){
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: const TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void login(String email, password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e){
      Get.snackbar("About login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: const TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void logOut() async{
    await auth.signOut();
  }


}