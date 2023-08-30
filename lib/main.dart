import 'package:authentication_app/controllers/auth_controller.dart';
import 'package:authentication_app/routes/app_pages.dart';
import 'package:authentication_app/views/home_screen.dart';
import 'package:authentication_app/views/login_screen.dart';
import 'package:authentication_app/views/signup_screen.dart';
import 'package:authentication_app/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Authentication App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen(),
      // getPages: AppPages.lists,
    );
  }
}

