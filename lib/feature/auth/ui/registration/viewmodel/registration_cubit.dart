import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/ui/registration/viewmodel/state.dart';

@injectable
class RegistrationViewModel extends Cubit<RegistrationState> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @factoryMethod
  RegistrationViewModel() : super(InitReg());

  String? emailValidator(String? val) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val!);
    return emailValid ? null : 'Please enter right email';
  }

  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        if (value.length < 8) {
          return 'password must be \n at least 8 characters';
        } else {
          return 'password should has \n at least \n one lower character ,\n one upper character\n , digit\n and special character';
        }
      } else {
        return null;
      }
    }
  }

  String? validateConfirmPassword(String? value) {
    return password.text == rePassword.text
        ? null
        : 'password and \nconfirm password not \nmatch';
  }

  String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateEmpty(String? value) {
    return value!.isEmpty ? 'Can not be Empty' : null;
  }

}
