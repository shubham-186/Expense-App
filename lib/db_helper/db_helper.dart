import 'dart:io';                                // For Directory
import 'package:expance_app_demo/model/expence_model.dart';
import 'package:path/path.dart';                 // For join()
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';           // For Database
import 'package:path_provider/path_provider.dart';
import '../model/user_model.dart'; // For getApplicationDocumentsDirectory()


class DBHelper{
  DBHelper._();

  ///private constructor
  static DBHelper getInstance() => DBHelper._();
  int rowEffected = 0;
  static String user_id_Key = "userId";
  Database? mDB;

  static const String TABLE_EXPENSE = "expense";
  static const String TABLE_USER = "user";

  /// user table columns
  static const String COLUMN_USER_ID = "user_id";
  static const String COLUMN_USER_NAME = "user_name";
  static const String COLUMN_USER_EMAIL = "user_email";
  static const String COLUMN_USER_MOB_NO = "user_mob_no";
  static const String COLUMN_USER_PASS = "user_pass";

  /// expense table columns
  static const String COLUMN_EXP_ID = "exp_id";
  static const String COLUMN_EXP_TITLE = "exp_title";
  static const String COLUMN_EXP_DESC = "exp_desc";
  static const String COLUMN_EXP_AMT = "exp_amt";
  static const String COLUMN_EXP_BAL = "exp_bal";
  static const String COLUMN_EXP_CAT_ID = "exp_cat_id";
  static const String COLUMN_EXP_TYPE = "exp_type";
  static const String COLUMN_EXP_CREATED_AT = "exp_created_at";

  Future<Database> initDB() async {

    mDB ??= await openDB();
    return mDB!;
    /*if(mDB==null){
      mDB = await openDB();
      return mDB!;
    } else {
      return mDB!;
    }*/
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "expDB.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      ///user table
      db.execute(
          "create table $TABLE_USER ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text, $COLUMN_USER_EMAIL text, $COLUMN_USER_MOB_NO text, $COLUMN_USER_PASS text)");

      ///expense table
      db.execute(
          "create table $TABLE_EXPENSE ( $COLUMN_EXP_ID integer primary key autoincrement, $COLUMN_USER_ID integer, $COLUMN_EXP_TITLE text, $COLUMN_EXP_DESC text, $COLUMN_EXP_AMT real, $COLUMN_EXP_BAL real, $COLUMN_EXP_CAT_ID integer, $COLUMN_EXP_TYPE integer, $COLUMN_EXP_CREATED_AT text)");
    });
  }

  ///events
  ///createUser
  Future<bool> createUser({required UserModel user}) async{

    var db = await initDB();

    rowEffected = await db.insert(TABLE_USER, user.toMap());

    return rowEffected>0;
  }
  ///checkIfUserAlreadyExists
  /*Future<bool> checkIfUserAlreadyExists({required String email}) async{
    var db = await initDB();

    List<Map<String, dynamic>> mData = await db.query(TABLE_USER, where: "$COLUMN_USER_EMAIL = ?", whereArgs: [email]);
    return mData.isNotEmpty;
  }*/

    Future<bool> checkIfUserAlreadyExist({required String email})async{
      mDB = await initDB();
     List<Map<String,dynamic>> mData = await mDB!.query(TABLE_USER,where: "$COLUMN_USER_EMAIL = ?",whereArgs: [email]);
      return mData.isNotEmpty;
    }

///authenticateUser
  Future<bool> authenticateUser({required String email, required String password})async{
    mDB = await initDB();
  List<Map<String,dynamic>> mData = await mDB!.query(TABLE_USER,where: "$COLUMN_USER_EMAIL and $COLUMN_USER_PASS",whereArgs: [email,password]);
    ///SharedPreferences
    if(mData.isNotEmpty){
      SharedPreferences preff = await SharedPreferences.getInstance();
      preff.setInt(user_id_Key, mData[0][COLUMN_USER_ID]);
    }
  return mData.isNotEmpty;
  }
///addExpense
  Future<bool> addExpense(ExpenseModel expense)async{
      mDB = await initDB();

      SharedPreferences preffs = await SharedPreferences.getInstance();
      int user_id = preffs.getInt(user_id_Key) ?? 0;
      expense.userId = user_id;

     rowEffected = await mDB!.insert(TABLE_EXPENSE, expense.toMap());
     return rowEffected>0;
  }
///fetchAllExpense
  void fetchAllExpence()async{
      mDB = await initDB();
      SharedPreferences preff = await SharedPreferences.getInstance();
      int user_id =  preff.getInt(user_id_Key)!;
      List<Map<String,dynamic>> expItems = await mDB!.query(TABLE_EXPENSE,
      where: "$COLUMN_USER_ID = ?", whereArgs: [user_id]
      );
      List<ExpenseModel> expList = [];
      for(int i = 0;i<expItems.length; i++){
        expList.add(ExpenseModel.fromMap(expItems[i]));
      }
  }
///updateExpense
///deleteExpense

}