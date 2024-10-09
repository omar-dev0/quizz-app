import 'controller_manger.dart';

abstract class ValidateManger{

 static String? validateEmptyField(){
    String? message;
    String email = ControllersManager().getFieldController("Email").text;
    String password = ControllersManager().getFieldController("Password").text;
    bool isEmptyEmail = _isEmailInputFieldEmpty(email);
    bool isEmptyPassword = _isPasswordInputFieldEmpty(password);

    if(isEmptyEmail && isEmptyPassword){
      message = "Both fields are required";
    }else if(isEmptyEmail){
      message = "Email is required";
    }else if(isEmptyPassword){
      message = "Password is required";
    }
    return message;
  }


  static bool _isEmailInputFieldEmpty(String email){
    return email.isEmpty;
  }

 static bool _isPasswordInputFieldEmpty(String password){
    return password.isEmpty;
  }

}