import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Welcome"),
          Text("Successfully Logged In..")
        ],
      ),
    );
  }
}