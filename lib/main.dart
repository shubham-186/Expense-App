import 'package:expance_app_demo/bloc/user_bloc.dart';
import 'package:expance_app_demo/db_helper/db_helper.dart';
import 'package:expance_app_demo/pages/add_expense_page.dart';
import 'package:expance_app_demo/pages/expanse_page.dart';
import 'package:expance_app_demo/pages/homepage.dart';
import 'package:expance_app_demo/pages/login_page.dart';
import 'package:expance_app_demo/pages/sign_up_page.dart';
import 'package:expance_app_demo/splash_demo.dart';
import 'package:expance_app_demo/statistic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    BlocProvider(create: (context)=>
        UserBloc(dbHelper: DBHelper.getInstance()),child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddExpence()
    );
  }
}


