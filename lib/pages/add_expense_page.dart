import 'package:expance_app_demo/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpence extends StatefulWidget {
  @override
  State<AddExpence> createState() => _AddExpenceState();
}

class _AddExpenceState extends State<AddExpence> {
  var expTitleController = TextEditingController();
  var expDescController = TextEditingController();
  var expAmtController = TextEditingController();
  int selectedProduct = -1;
  List<String> mExpType = ["Debit", "Credit"];
  String selectedExpType = "Debit";
  DateTime? selectedDate;
  DateFormat df = DateFormat.yMMMEd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Add Expense",
          style: TextStyle(fontSize: 13),
        ),
        actions: [
          // IconButton(onPressed: (){}, icon:(Icon(Icons.monetization_on, size: 26,))),
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Image.asset("assets/images/payment.png",width:38,height: 35,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 11),
          // height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset("assets/images/info_page.png",width: 150,height: 150,),
              SizedBox(height: 20),
              TextFormField(
                controller: expTitleController,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  label: Text("Title", style: TextStyle(fontSize: 12)),
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(61),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(61),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: expDescController,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  label: Text("Desc", style: TextStyle(fontSize: 12)),
                  hintText: "Desc",
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(61),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(61),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: expAmtController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  label: Text("Amount", style: TextStyle(fontSize: 12)),
                  hintText: "Amount",
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(61),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(61),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 18,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: mExpType.map((type) {
                    return Row(
                      children: [
                        Radio<String>(
                          value: type,
                          groupValue: selectedExpType,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              selectedExpType = value!;
                            });
                          },
                        ),
                        Text(type),
                      ],
                    );
                  }).toList(),
                ),

                // child: DropdownButton<String>(
                //   value: selectedExpType,
                //   items: mExpType.map((e) {
                //     return DropdownMenuItem<String>(
                //       child: Text(e),
                //       value: e,
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       selectedExpType = value!;
                //     });
                //   },
                // ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    side: BorderSide(color: Colors.white, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          height: 250,
                          child: GridView.builder(
                            itemCount: ProductModel.exData.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedProduct = index;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      ProductModel.exData[index]["expName"],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                    SizedBox(height: 4),
                                    Image.asset(
                                      ProductModel.exData[index]["img"],
                                      width: 35,
                                      height: 35,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: selectedProduct >= 0
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ProductModel.exData[selectedProduct]["img"],
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 8),
                      Text(
                        ProductModel.exData[selectedProduct]["expName"],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                      : Text(
                    "Choose Category",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    side: BorderSide(color: Colors.white, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now().subtract(Duration(days: 182)),
                        lastDate: DateTime.now(),
                        // initialDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },


                    child: Text(df.format((selectedDate ?? DateTime.now())),
                    style: TextStyle(color: Colors.white),)
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.blue, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: (){

                    },
                    child: Text("Add Expense",style: TextStyle(color: Colors.blue),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
