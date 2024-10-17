import 'package:flutter/cupertino.dart';
import 'package:quizz_app/core/local/local.dart';

class ControllersManager {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController getFieldController(String field) {
    if (field ==AppStrings.password) return _passwordController;
    return _emailController;
  }

  void setEmailControllerValue(String email){
    _emailController.text = email;
  }
  void setPasswordControllerValue(String password){
    _passwordController.text= password;
  }
   TextEditingController get emailController => _emailController;
   TextEditingController get passwordController => _passwordController;
}
