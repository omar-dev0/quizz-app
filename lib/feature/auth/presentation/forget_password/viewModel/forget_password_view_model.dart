import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/model/Otp_respones_entity.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'forget_password_screen_State.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordScreenState>{
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordViewModel(this._forgetPasswordUseCase): super(InitialForgetPasswordScreenState());
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  String? emailValidation(){
    if(emailController.text.isEmpty || !emailController.text.contains("@")){
      emit(FailInputValidation());
      isButtonEnabled = false;
      return "invalid email";
    }
    isButtonEnabled = true;
    emit(SuccessInputValidation());
    return null;
  }

  _sentOptCode() async{
    if(emailFormKey.currentState!.validate()){
      emit(ForgetPasswordLoadingState());
      final result = await _forgetPasswordUseCase.invoke(emailController.text);
      switch (result) {
        case Success<OtpResponesEntity>():
          emit(ForgetPasswordSuccessState());
          break;
        case ServerFailure<OtpResponesEntity>():
          emit(ForgetPasswordFailState(result.message));
          break;
      }
    }
  }

  bool? formValidation(){
    if(emailFormKey.currentState!.validate()){
      bool isButtonEnabled = true;
      emit(SuccessInputValidation());
      return true;
    }
    isButtonEnabled = false;
    emit(FailInputValidation());
    return false;
  }

  void doAction(ForgetPasswordActions action){
    switch (action) {
      case InitialScreenAction():
         break;
      case NavigateToVerificationEmailScreenAction():
        emit(NavigateToEmailVerificationScreenState());
        break;
      case NavigateToResetPasswordScreenAction():
        emit(NavigateToResetPasswordScreenState());
        break;
      case NavigateBackAction():
        emit(NavigateBackState());
        break;
      case SentOtpCodeAction():
        _sentOptCode();
        break;
      case NavigateToLoginScreenAction():
        emit(NavigateToLoginScreenState());
       break;
      case CheckValidationInputAction():
        formValidation();
        break;
    }
  }
}

