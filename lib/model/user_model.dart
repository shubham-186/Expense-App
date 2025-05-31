
import 'package:expance_app_demo/db_helper/db_helper.dart';

class UserModel{
int? userID;
String userName;
String userMobNo;
String userEmail;
String userPass;

UserModel({this.userID,required this.userName,required this.userMobNo,required this.userEmail,required this.userPass});

   Map<String,dynamic> toMap()=>{
     DBHelper.COLUMN_USER_ID:userID,
     DBHelper.COLUMN_USER_NAME:userName,
     DBHelper.COLUMN_USER_MOB_NO:userMobNo,
     DBHelper.COLUMN_USER_EMAIL:userEmail,
     DBHelper.COLUMN_USER_PASS:userPass
   };

    UserModel fromMap(Map<String,dynamic> map){
     return UserModel(userName: map[DBHelper.COLUMN_USER_NAME],
         userMobNo: map[DBHelper.COLUMN_USER_MOB_NO],
         userEmail: DBHelper.COLUMN_USER_EMAIL,
         userPass: DBHelper.COLUMN_USER_PASS
     );
   }
}