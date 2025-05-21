import 'package:expance_app_demo/pages/expanse_page.dart';
import 'package:expance_app_demo/pages/homepage.dart';
import 'package:expance_app_demo/pages/login_page.dart';
import 'package:expance_app_demo/pages/sign_up_page.dart';
import 'package:expance_app_demo/splash_demo.dart';
import 'package:expance_app_demo/statistic_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}


