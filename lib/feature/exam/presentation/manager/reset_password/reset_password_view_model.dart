


import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/helpers/app_regex.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/model/update_password_entity.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/update_password_use_case.dart';
import 'package:quizz_app/feature/exam/presentation/manager/reset_password/reset_password_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/reset_password/reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState>{
  final UpdatePasswordUseCase _updatePasswordUseCase;
  ResetPasswordViewModel(this._updatePasswordUseCase):super(InitialState());
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
     emit(FailureValidationState());
     return false;
   }
   _changePasswordObscure() {
     isPasswordObscure = !isPasswordObscure;
      emit(PasswordObscureState());
   }

  _updatePassword()async{
     if(_validateFields()){
       log("Active button is $isActiveButton");
       emit(LoadingState());
       String oldPassword = currentPasswordController.text;
        String newPassword = newPasswordController.text;
        String rePassword = confirmPasswordController.text;
       var result = await _updatePasswordUseCase.updatePassword(oldPassword, newPassword, rePassword);
       switch (result) {
         case Success<UpdatePasswordEntity>():
           emit(SuccessState(message: "Password updated successfully"));
           break;
         case ServerFailure<UpdatePasswordEntity>():
           emit(FailureState(message: result.message));
           break;
       }
     }
  }
   void doAction(ResetPasswordActions action){
      switch (action) {
        case ValidateFieldsAction():
          _validateFields();
          break;
        case UpdatePasswordAction():
          _updatePassword();
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