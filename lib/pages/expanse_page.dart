import 'package:expance_app_demo/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Monety",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(

          children: [
            SizedBox(height: 160,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset("assets/images/info_page.png",width: 200,height: 200,),
            ),
            SizedBox(height: 15),
            Text("Easy way to monitor",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Text("your expense",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Safe Your future by managing your",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: "Thin_text"),),
            Text("expense right now",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: "Thin_text"),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>
            HomePage()
        ));
      },child: Icon(Icons.navigate_next),),
    );
  }
}