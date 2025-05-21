import 'package:expance_app_demo/Expense%20Model/expanse_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../statistic_page.dart';

///--> ColorCode --> Color(0x86)

class HomePage extends StatelessWidget{
 final List<Map<String,dynamic>> expList = ExpenseModel.expData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Monety",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Image.asset("assets/Icons/search_icon.png",width: 20,height: 20,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Stack(
                children: [
                  Container(
                    height: 55,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //     border: Border.all(
                    //         width: 1
                    //     )
                    // ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(20),
                              child: Image.asset("assets/images/round_img.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Text("Morning",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: "Thin_text"),),
                              Text("Shubham",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: "semiBold"),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 3,
                      right: 3,
                      child: Container(
                        height: 50,
                        width: 140,
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0x86EFF1FE),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("This month",style: TextStyle(fontSize: 15),),
                            Image.asset("assets/images/dropdown.png",width: 12,height: 12,)
                          ],
                        ),
                  ))
                ],
              )
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 168,
                width: double.infinity,
        
                decoration: BoxDecoration(
                  // color: Colors.pink  ,
                  color: Color(0xFF6674D3), ///Bold
                  // color: Color(0xFF4450B0),///Dark Tone
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child:Padding(
                  padding: const EdgeInsets.only(top: 24,left: 19),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expense Total",style: TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height:2,),
                          Text("\$3,734",style: TextStyle(color: Colors.white,fontSize: 38,fontFamily: "semiBold"),),
                          Row(
                            children: [
                              Center(
                                child: Container(
                                  height: 25,
                                  width: 48,
                                  color: Colors.red,
                                  child: Text("+\$240",style: TextStyle(fontSize: 12,color: Colors.white),),
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text("than last month",style: TextStyle(fontSize: 10,color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 10,),
                      Transform.translate(
                        offset:  Offset(0, -15),
                          child: Image.asset("assets/images/money_pie.png",width: 160,height: 170,)),
                        ],
                  ),
                )
              ),
            ),
            SizedBox(height: 7,),
            Row(
              children: [
                SizedBox(width: 12,),
                SizedBox(
                    child: Text("Expense List",style: TextStyle(fontSize: 16,fontFamily: "semiBold"),)),
              ],
            ),
            SizedBox(height: 2,),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), // 🔥 shadow color
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(2, 1), // horizontal and vertical shift
                    ),
                  ],
                ),

                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Date & Total Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tuesday, 14", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                        Text("-\$1380", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                      ],
                    ),

                    /// 🔹 Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),

                    /// 🔹 Scrollable ListView inside fixed-height Card
                    Expanded(
                      child: ListView.builder(
                        itemCount: expList.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade600,
                                    border: Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Image.asset(
                                      expList[index]["img"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(expList[index]["expName"], style: TextStyle(fontSize: 14)),
                                      Text(expList[index]["expDetail"], style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                                    ],
                                  ),
                                ),
                                Text(
                                  expList[index]["rate"] ?? "-0",
                                  style: TextStyle(fontSize: 12, color: Colors.red.shade300),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2,),
//////////////////////////////////////////////////////////////////////////////////////
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), // 🔥 shadow color
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(2, 1), // horizontal and vertical shift
                    ),
                  ],
                ),

                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Date & Total Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tuesday, 14", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                        Text("-\$1380", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                      ],
                    ),

                    /// 🔹 Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),

                    /// 🔹 Scrollable ListView inside fixed-height Card
                    Expanded(
                      child: ListView.builder(
                        itemCount: expList.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade600,
                                    border: Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Image.asset(
                                      expList[index]["img"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(expList[index]["expName"], style: TextStyle(fontSize: 14)),
                                      Text(expList[index]["expDetail"], style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                                    ],
                                  ),
                                ),
                                Text(
                                  expList[index]["rate"] ?? "-0",
                                  style: TextStyle(fontSize: 12, color: Colors.red.shade300),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2,), /// <-- Temp Items
//////////////////////////////////////////////////////////////////////////////////////
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), // 🔥 shadow color
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(2, 1), // horizontal and vertical shift
                    ),
                  ],
                ),

                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Date & Total Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tuesday, 14", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                        Text("-\$1380", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                      ],
                    ),

                    /// 🔹 Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),

                    /// 🔹 Scrollable ListView inside fixed-height Card
                    Expanded(
                      child: ListView.builder(
                        itemCount: expList.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade600,
                                    border: Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Image.asset(
                                      expList[index]["img"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(expList[index]["expName"], style: TextStyle(fontSize: 14)),
                                      Text(expList[index]["expDetail"], style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                                    ],
                                  ),
                                ),
                                Text(
                                  expList[index]["rate"] ?? "-0",
                                  style: TextStyle(fontSize: 12, color: Colors.red.shade300),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2,), /// <-- Temp Items
//////////////////////////////////////////////////////////////////////////////////////
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), // 🔥 shadow color
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(2, 1), // horizontal and vertical shift
                    ),
                  ],
                ),

                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Date & Total Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tuesday, 14", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                        Text("-\$1380", style: TextStyle(fontSize: 13, fontFamily: "semiBold")),
                      ],
                    ),

                    /// 🔹 Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(color: Colors.grey.shade300, thickness: 1),
                    ),

                    /// 🔹 Scrollable ListView inside fixed-height Card
                    Expanded(
                      child: ListView.builder(
                        itemCount: expList.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade600,
                                    border: Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Image.asset(
                                      expList[index]["img"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(expList[index]["expName"], style: TextStyle(fontSize: 14)),
                                      Text(expList[index]["expDetail"], style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                                    ],
                                  ),
                                ),
                                Text(
                                  expList[index]["rate"] ?? "-0",
                                  style: TextStyle(fontSize: 12, color: Colors.red.shade300),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2,), /// <-- Temp Items
//////////////////////////////////////////////////////////////////////////////////////


            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: Container(
            //     height: 190,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         width: 1,
            //         color: Colors.grey.shade300
            //       )
            //     ),
            //     child: Column(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(top: 10,left: 5),
            //               child: Text("Tuesday,14",style: TextStyle(fontSize: 13,fontFamily: "semiBold")),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 10,right: 5),
            //               child: Text('-\$1380',style: TextStyle(fontSize: 13,fontFamily: "semiBold"),),
            //             ),
            //           ],
            //         ),
            //         SizedBox(height: 12,),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 7),
            //           child: Container(
            //             height: 1,
            //             width: double.infinity,
            //             decoration: BoxDecoration(
            //                 border: Border.all(
            //                     width: 1,
            //                     color: Colors.grey.shade300
            //                 )
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: 10,),
            //         Container(
            //           height: 125,
            //           width: double.infinity,
            //           // decoration: BoxDecoration(
            //           //   border: Border.all(
            //           //     width: 1
            //           //   )
            //           // ),
            //           child: ListView.builder(
            //             itemCount: expList.length,
            //             itemBuilder: (ctx, index) {
            //               return Padding(
            //                 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            //                 child: Row(
            //                   children: [
            //                     Container(
            //                       width: 60,
            //                       height: 60,
            //                       decoration: BoxDecoration(
            //                         color: Colors.yellow.shade600,
            //                         border: Border.all(
            //                           color: Colors.black,
            //                           width: 1.0,
            //                         ),
            //                         borderRadius: BorderRadius.circular(4), // Optional: Rounded border
            //                       ),
            //                       child: ClipRRect(
            //                         borderRadius: BorderRadius.circular(2), // same as or less than container
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(6),
            //                           child: Image.asset(
            //                             expList[index]["img"]!,
            //                             fit: BoxFit.cover,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     SizedBox(width: 16),
            //                     Expanded(
            //                       child: Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             expList[index]["expName"],
            //                             style: TextStyle(fontSize: 16),
            //                           ),
            //                           Text(
            //                             expList[index]["expDetail"],
            //                             style: TextStyle(fontSize: 12,color: Colors.grey.shade600),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                  Text(expList[index]["rate"] ?? "-0",
            //                    textAlign: TextAlign.right,
            //                    style: TextStyle(fontSize: 12,color: Colors.red.shade300),),
            //                   ],
            //                 ),
            //               );
            //             },
            //           ),
            //
            //         )
            //       ],
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>StatisticPage()));
      },child: Icon(Icons.navigate_next),),
    );
  }
}