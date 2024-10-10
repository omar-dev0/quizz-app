import 'package:flutter/cupertino.dart';

sealed class LoginScreenActions{}


class LoginAction extends LoginScreenActions{}

class LoginFormInputValidate extends LoginScreenActions{}
class ForgetPasswordNavigatorAction extends LoginScreenActions{
  BuildContext context;
  ForgetPasswordNavigatorAction(this.context);
}

class CheckedBoxAction extends LoginScreenActions{
  bool isBoxChecked;
  CheckedBoxAction(this.isBoxChecked);
}


