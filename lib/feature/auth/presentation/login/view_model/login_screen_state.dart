import '../../../domain/model/user.dart';

sealed class LoginScreenState{}

class InitialScreenState extends LoginScreenState{}

class LoadingState extends LoginScreenState{}

class EmptyFiledState extends LoginScreenState{}


class RememberMeBoxCheckedState extends LoginScreenState{
  bool isChecked;
  RememberMeBoxCheckedState(this.isChecked);
}

class LoginErrorState extends LoginScreenState{
  String? message;
  LoginErrorState(this.message);
}

class NavigateToForgetPasswordScreenState extends LoginScreenState{}

class LoginSuccessState extends LoginScreenState{
  User? user;
  LoginSuccessState(this.user);
}
