class ExpenseModel{
  static List<Map<String, String>> mData = [
    {
      "img": "assets/Icons/cart_ic.png",
      "title":"Shop",
      "subtitle":"-\$1190",
    },
    {
      "img": "assets/Icons/cart_ic.png",
      "title":"Shop",
      "subtitle":"-\$867",
    },
    {
      "img": "assets/Icons/cart_ic.png",
      "title":"Shop",
      "subtitle":"-\$1190",
    },
  ];
  static List<Map<String, String>> expense() {
    return mData;
  }
  static List<Map<String,dynamic>> exData = [
    {
      "img":"assets/images/shoping.png",
      "expName":"Shop",
      "expDetail":"Shimla Tour",
      "rate":"-\$124"
    },
    {
      "img":"assets/images/truck.png",
      "expName":"Travels",
      "expDetail":"Shimla Tour",
      "rate":"-\$1278"
    },
    {
      "img":"assets/images/motherboard.png",
      "expName":"Electronic",
      "expDetail":"Shimla Tour",
      "rate":"-\$7824"
    },
  ];
  static List<Map<String,dynamic>> expData(){
    return exData;
  }
}