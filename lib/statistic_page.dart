import 'package:flutter/material.dart';
import 'model/product_model.dart';

class StatisticPage extends StatelessWidget{
  final List<Map<String, String>> expenseList = ProductModel.expense();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 39,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text("Statistic",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  height: 50,
                  width: 140,
                  color: Color(0x86EFF1FE),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 1,
                  //   ),
                  //   color: Color(0x86EFF1FE),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("This month",style: TextStyle(fontSize: 15),),
                      SizedBox(width: 12,),
                      Image.asset("assets/images/dropdown.png",width: 12,height: 12,),
                      SizedBox(width: 5,)
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Container(
              height: 111,
              width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF6674D3),
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),///Bold
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Expense",style: TextStyle(fontSize: 12,color: Colors.white),),
                        SizedBox(height: 3,),
                        Row(
                          children: [
                            Text("\$3,734",style: TextStyle(color: Colors.white,fontSize: 28,fontFamily: "semiBold"),),
                            Text("  /\$4,000 per month",style: TextStyle(color: Colors.grey.shade400,fontSize: 12),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Stack(
                            children: [
                              Container(
                                height: 3,
                                width: 301,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                              ),
                              Container(
                                height: 3,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.yellow.shade300,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                              ),
                            ],
                          ),
                      ],
                    )
                  ],
                ),
              )
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Expense Breakdown",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "semiBold"),),
                  Container(
                    width: 85,
                    height: 40,
                      // color: Color(0x86EFF1FE),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.6),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Week"),
                            SizedBox(width: 10,),
                            Image.asset("assets/images/dropdown.png",width: 12,height: 12,),
                          ],
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(children: [Text("Limit \$900 / week",style: TextStyle(fontSize: 12.5,fontWeight: FontWeight.bold,fontFamily: "Thin_text"),),],),
          ),
          Container(        /// <--- Bar Graph
            width: 340,height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text("Spending Details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "semiBold"),),],
            ),
          ),
          SizedBox(height: 4,),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text("Your expense are divided into 6 categories",style: TextStyle(fontSize: 13,),),
              ],
            ),
          ),
          Image.asset("assets/images/expenses_cate.png",width: 338,height: 100,),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: expenseList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        expenseList[index]["img"]!,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expenseList[index]["title"]!,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          SizedBox(height: 4),
                          Text(
                            expenseList[index]["subtitle"]!,
                            style: TextStyle(fontSize: 12, color: Colors.red.shade300),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}