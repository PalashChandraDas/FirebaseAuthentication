
import 'package:authentication_app/controllers/auth_controller.dart';
import 'package:authentication_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  HomeScreen({super.key,required this.email});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(_homeController.appBarTitle),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.deepOrange),),
              const SizedBox(height: 10,),
              Text(email),
              const SizedBox(height: 10,),
              OutlinedButton(onPressed: () {
                AuthController.instance.logOut();
              }, child: Text(_homeController.logOutBtnTxt)),
            ],
          ),
        ),
      ),

    );
  }
}
