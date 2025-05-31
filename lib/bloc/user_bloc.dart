import 'package:expance_app_demo/bloc/user_event.dart';
import 'package:expance_app_demo/bloc/user_state.dart';
import 'package:expance_app_demo/db_helper/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  DBHelper dbHelper;
  UserBloc({required this.dbHelper}) : super(UserInitialState()){

    on<RegisterUserEvent>((event,emit)async{
      emit(UserLoadingState());

      bool oldUser = await dbHelper.checkIfUserAlreadyExist(email: event.newUser.userEmail);

      if(!oldUser){
        // emit(UserSuccessState());
        bool check = await dbHelper.createUser(user: event.newUser);
        if(check){
          emit(UserSuccessState());
        }{
          emit(UserFailiurState(errorMessage: "Something went Wrong"));
        }
      }else{
        emit(UserFailiurState(errorMessage: "User Already Exists"));
      }
    });

    on<UserLoginEvent>((event,emit)async{
      emit(UserLoadingState());

      bool isUserAuth = await dbHelper.authenticateUser(email: event.userLogin.userEmail, password: event.userLogin.userPass);
      if(isUserAuth){
        emit(UserSuccessState());
      }else{
        emit(UserFailiurState(errorMessage: "Invalid Credentials"));
      }
    });
  }
}