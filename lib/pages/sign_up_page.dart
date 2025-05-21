import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logged_page.dart';

class SignUpPage extends StatelessWidget{
  static const String Logged_KEY = "loginKey";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          // Blue curved header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),

          // White login section
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Email, Password, Buttons etc.
                    SizedBox(height: 10,),/// Sign Up Image
                    Image.asset("assets/images/lock.png",width: 65,height: 65,),
                    SizedBox(height: 30,),
                    TextField(
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.account_circle_sharp,color: Colors.blue,),
                          // label: Text("Email",style: TextStyle(color: Colors.blue),),
                          label: Text("Name",style: TextStyle(fontSize: 12),),
                          hintText: "Name",
                          hintStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),

                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          ),

                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email_outlined,color: Colors.blue,),
                          label: Text("Email",style: TextStyle(fontSize: 12),),
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone,color: Colors.blue,),
                          label: Text("Phone",style: TextStyle(fontSize: 12),),
                          hintText: "Phone",
                          hintStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    SizedBox(height: 20,),
                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.lock,color: Colors.blue,),
                          label: Text("Password",style: TextStyle(fontSize: 12),),
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(61)
                          )
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text("Forget Password",style:
                          TextStyle(color: Colors.black54,
                              fontSize: 10,
                              fontFamily: "semiBold"
                          ),),
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      elevation: 3, // Shadow depth (zyada karna ho to increase karo)
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("or continue with",style: TextStyle(fontSize: 10,color: Colors.black),),
                    SizedBox(height: 19),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 135,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(24)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/google.png",width: 22,height: 22,),
                              Text("Google",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          width: 135,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(24)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/apple_1.png",width: 22,height: 22,),
                              Text("Apple",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 9,),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",style: TextStyle(color: Colors.grey),),
                        Text("Sign In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // AppBar-style Login text in center
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/back.png"),
                    ),
                  ),
                ),
                // Image.asset("assets/images/lock.png", width: 30, height: 30,),
              ],
            ),
          )
        ],
      ),
    );

  }
}
