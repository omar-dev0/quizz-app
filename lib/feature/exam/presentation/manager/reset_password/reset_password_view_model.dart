


import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/helpers/app_regex.dart';
import 'package:quizz_app/feature/exam/presentation/manager/reset_password/reset_password_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/reset_password/reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState>{
  ResetPasswordViewModel():super(InitialState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordObscure = true;
  bool isActiveButton = false;
   String? validatePassword(ResetPasswordFormFields field){
     String password;
     if(field == ResetPasswordFormFields.currentPassword) {
       password = currentPasswordController.text;
     }
      else if(field == ResetPasswordFormFields.newPassword){
        password = newPasswordController.text;
      }
      else{
        password = confirmPasswordController.text;
     }
      if(password.isEmpty ||!AppRegex.isPasswordValid(password)){
        return 'invalid password';
      }
      if(field == ResetPasswordFormFields.confirmPassword){
        if(newPasswordController.text != confirmPasswordController.text) {
          return 'passwords do not match';
        }
      }
     return null;
   }


   _validateFields(){
     if(formKey.currentState!.validate()){
       isActiveButton = true;
       emit(SuccessValidationState());
       log("Active button is $isActiveButton");
       return true;
     }
     isActiveButton = false;
     log("Active button is $isActiveButton");
     emit(FailureValidationState());
     return false;
   }
   _changePasswordObscure() {
     isPasswordObscure = !isPasswordObscure;
      emit(PasswordObscureState());
   }
   void doAction(ResetPasswordActions action){
      switch (action) {
        case ValidateFieldsAction():
          _validateFields();
          break;
        case UpdatePasswordAction():
           break;
        case ChangePasswordObscureAction():
           _changePasswordObscure();
           break;
      }
   }
}

enum ResetPasswordFormFields{
  currentPassword,
  newPassword,
  confirmPassword
}