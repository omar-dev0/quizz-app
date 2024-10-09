import '../../../domain/model/user.dart';

sealed class LoginScreenState{}

class InitialScreenState extends LoginScreenState{}

class LoadingState extends LoginScreenState{}

class EmptyFiledState extends LoginScreenState{
  String message;
  EmptyFiledState(this.message);
}

class RememberMeBoxCheckedState extends LoginScreenState{
  bool isChecked;
  RememberMeBoxCheckedState(this.isChecked);
}

class LoginErrorState extends LoginScreenState{
  Exception? exception;
  LoginErrorState(this.exception);
}

class LoginSuccessState extends LoginScreenState{
  User? user;
  LoginSuccessState(this.user);
}
