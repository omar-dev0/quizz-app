import 'package:flutter/cupertino.dart';

sealed class LoginScreenActions{}

class InitialScreenAction extends LoginScreenActions{}
class LoginAction extends LoginScreenActions{}

class LoginFormInputValidate extends LoginScreenActions{}
class ForgetPasswordNavigatorAction extends LoginScreenActions{}

class CheckedBoxAction extends LoginScreenActions{
  bool isBoxChecked;
  CheckedBoxAction(this.isBoxChecked);
}


