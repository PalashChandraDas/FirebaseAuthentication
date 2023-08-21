import 'package:authentication_app/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/login_controller.dart';
import '../routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(_loginController.appBarTitle),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _loginController.userMailController,
                decoration: InputDecoration(
                  hintText: _loginController.emailHint,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                obscureText: true,
                controller: _loginController.userPasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: _loginController.passwordHint),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {
                AuthController.instance.register(_loginController.userMailController.text.trim(),
                    _loginController.userPasswordController.text.trim());
              }, child: const Text('Sign Up')),
              const SizedBox(
                height: 40,
              ),
              RichText(text: const TextSpan(
            text: "Sign up using on the following method",
            style: TextStyle(fontSize: 16, color: Colors.grey),)),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {

              }, icon: const Icon(Icons.g_mobiledata_rounded, size: 40,)),
                  const SizedBox(width: 15,) ,
                IconButton(onPressed: () {

              }, icon: const Icon(Icons.facebook, size: 40,)),
              ],


        ),

            ],
          ),
        ),
      ),
    );
  }
}
