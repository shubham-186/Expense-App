import 'package:expance_app_demo/model/user_model.dart';

abstract class UserEvent{}
class RegisterUserEvent extends UserEvent {
  UserModel newUser;
  RegisterUserEvent({required this.newUser});
}
class UserLoginEvent extends UserEvent{
  UserModel userLogin;
  UserLoginEvent({required this.userLogin});
}

