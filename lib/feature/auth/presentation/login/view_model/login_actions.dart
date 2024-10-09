sealed class Actions{}


class LoginAction extends Actions{
  String email;
  String password;
  LoginAction(this.email, this.password);
}

class ForgetPasswordAction extends Actions{

}

class CheckedBoxAction extends Actions{
  bool isBoxChecked;
  CheckedBoxAction(this.isBoxChecked);
}