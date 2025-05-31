abstract class UserState{}
class UserInitialState extends UserState {}
class UserLoadingState extends UserState {}
class UserSuccessState extends UserState{}
class UserFailiurState extends UserState{
  String errorMessage;
  UserFailiurState({required this.errorMessage});
  void add(){}
}