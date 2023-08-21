import 'package:authentication_app/views/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';
import '../routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loginController.appBarTitle),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
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
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: _loginController.passwordHint),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: () {
                AuthController.instance.login(_loginController.userMailController.text.trim(),
                    _loginController.userPasswordController.text.trim());
              }, child: const Text('Sign in')),
              const SizedBox(
                height: 30,
              ),
              RichText(text: TextSpan(
                  text: "Don't have an account?",
              style: const TextStyle(fontSize: 20, color: Colors.grey),
              children: [
                TextSpan(
                    text: " Create",
                    style: const TextStyle(fontSize: 20, color: Colors.black,
                    fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(SignUpScreen())
                ),
              ]
              ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
