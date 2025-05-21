import 'dart:async';

import 'package:expance_app_demo/pages/expanse_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logged_page.dart';
import 'pages/login_page.dart';

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPreferences? sp;
  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () async{

      // sp = await SharedPreferences.getInstance();
      // bool? check = sp?.getBool(LoginPage.Logged_KEY);
      // Widget nextPage = LoginPage();
      // if(check != null){
      //   if(check){
      //     nextPage = LoggedHomePage();
      //   }else{
      //     nextPage = LoginPage();
      //   }
      // }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>ExpansePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/expanse_logo.jpg",width: 250,height: 250,),
            Text("Expense App",style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}

