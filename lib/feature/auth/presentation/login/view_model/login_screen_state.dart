import '../../../domain/model/user.dart';

sealed class LoginScreenState{}

class InitialScreenState extends LoginScreenState{}

class LoadingState extends LoginScreenState{}



class LoginErrorState extends LoginScreenState{
  Exception? exception;
  LoginErrorState(this.exception);
}

class LoginSuccessState extends LoginScreenState{
  User? user;
  LoginSuccessState(this.user);
}
