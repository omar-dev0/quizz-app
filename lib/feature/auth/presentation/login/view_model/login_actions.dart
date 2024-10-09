sealed class LoginScreenActions{}


class LoginAction extends LoginScreenActions{}


class ForgetPasswordAction extends LoginScreenActions{

}

class CheckedBoxAction extends LoginScreenActions{
  bool isBoxChecked;
  CheckedBoxAction(this.isBoxChecked);
}


