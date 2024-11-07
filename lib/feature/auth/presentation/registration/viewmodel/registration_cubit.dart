import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:quizz_app/feature/auth/presentation/registration/viewmodel/registration_events.dart';
import 'package:quizz_app/feature/auth/presentation/registration/viewmodel/state.dart';

@injectable
class RegistrationViewModel extends Cubit<RegistrationState> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepository _authRepo;
  @factoryMethod
  RegistrationViewModel(this._authRepo) : super(InitReg());




  void doEvent(RegistrationEvent event){
    switch (event) {

      case SignUpClicked():
        _signUp();
      case SignInClicked():
        _navigateToLogin();
    }
  }

  void emitSate(state)
  {
    emit(state);
  }

  void _signUp()async{
    if(formKey.currentState!.validate()) {
      emit(LoadingReg());
      final User appUser = User(
        email: email.text,
        phone: phone.text,
        firstName: firstName.text,
        lastName: lastName.text,
        username: userName.text,
      );
      Result<void> result = await _authRepo.signUp(
          appUser, password.text, rePassword.text);
      switch (result) {
        case Success():
          {
            emit(HideLoadingDialog());
            emit(SuccessReg());
            Future.delayed(const Duration(seconds: 2) ,()=>emit(NavigateToLogin()) );
          }
        case Fail():
          {
            emit(HideLoadingDialog());
            emit(FailReg(error: result.error));
          }
        case ServerFailure<void>():
          emit(HideLoadingDialog());
          emit(FailReg(error: result.message));
      }
    }
  }

  void _navigateToLogin(){
    emit(NavigateToLogin());
    emit(InitReg());
  }

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
    String pattern = r'^01[0125][0-9]{8}$';
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
