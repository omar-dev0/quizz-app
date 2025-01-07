import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/helpers/app_regex.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/model/Otp_respones_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/reset_password_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/verify_otp_entity.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'forget_password_screen_State.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordScreenState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordViewModel(this._forgetPasswordUseCase)
      : super(InitialForgetPasswordScreenState());
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  CurrentScreenState currentScreenState = CurrentScreenState.CheckEmailScreen;
  bool isButtonEnabled = false;
  bool isObscureText = true;

  String? emailValidation() {
    if (emailController.text.isEmpty ||
        !emailController.text.contains("@") ||
        !emailController.text.contains(".") ||
        !AppRegex.isEmailValid(emailController.text)) {
      emit(FailInputValidation());
      isButtonEnabled = false;
      return "invalid email";
    }
    isButtonEnabled = true;
    emit(SuccessInputValidation());
    return null;
  }

  _sentOptCode() async {
    if (emailFormKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState(message: "Sending Otp"));
      final result = await _forgetPasswordUseCase.invoke(emailController.text);
      switch (result) {
        case Success<OtpResponesEntity>():
          emit(ForgetPasswordSuccessState("Otp code sent successfully"));
          break;
        case ServerFailure<OtpResponesEntity>():
          emit(ForgetPasswordFailState(result.message));
          break;
      }
    }
  }

  bool? formValidation() {
    if (emailFormKey.currentState!.validate()) {
      isButtonEnabled = true;
      emit(SuccessInputValidation());
      return true;
    }
    isButtonEnabled = false;
    emit(FailInputValidation());
    return false;
  }

  _verifyOtpCode(String otp) async {
    emit(ForgetPasswordLoadingState(message: "Verifying Otp"));
    var result = await _forgetPasswordUseCase.verifyOtp(otp);
    switch (result) {
      case Success<VerifyOtpCodeEntity>():
        emit(ForgetPasswordSuccessState("Otp code verified successfully"));
        break;
      case ServerFailure<VerifyOtpCodeEntity>():
        emit(ForgetPasswordFailState(result.message));
        break;
    }
  }

  _resetPassword() async {
    if (_resetPasswordValidationForm()) {
      emit(ForgetPasswordLoadingState(message: "Resetting password"));
      var result = await _forgetPasswordUseCase.resetPassword(
          emailController.text, newPasswordController.text);
      switch (result) {
        case Success<ResetPasswordEntity>():
          emit(ForgetPasswordSuccessState("Password reset successfully"));
          break;
        case ServerFailure<ResetPasswordEntity>():
          emit(ForgetPasswordFailState(result.message));
          break;
      }
    }
  }

  _goToNextState() {
    switch (currentScreenState) {
      case CurrentScreenState.CheckEmailScreen:
        currentScreenState = CurrentScreenState.OtpVerificationScreen;
        emit(GoToNextState());
        break;
      case CurrentScreenState.OtpVerificationScreen:
        currentScreenState = CurrentScreenState.ResetPasswordScreen;
        emit(GoToNextState());
        break;
      case CurrentScreenState.ResetPasswordScreen:
        emit(NavigateToLoginScreenState());
        break;
    }
  }

  _goToPreviousState() {
    switch (currentScreenState) {
      case CurrentScreenState.CheckEmailScreen:
        emit(NavigateToLoginScreenState());
        break;
      case CurrentScreenState.OtpVerificationScreen:
        currentScreenState = CurrentScreenState.CheckEmailScreen;
        emit(PreviousState());
        break;
      case CurrentScreenState.ResetPasswordScreen:
        currentScreenState = CurrentScreenState.CheckEmailScreen;
        emit(PreviousState());
        break;
    }
  }

  _changePasswordVisibility() {
    isObscureText = !isObscureText;
    emit(ChangePasswordVisibilityState());
  }

  String? passwordValidation() {
    if (newPasswordController.text.isEmpty ||
        !AppRegex.isPasswordValid(newPasswordController.text)) {
      emit(FailInputValidation());
      return "invalid password";
    }
    return null;
  }

  String? confirmPasswordValidation() {
    if (confirmNewPasswordController.text.isEmpty ||
        !AppRegex.isPasswordValid(confirmNewPasswordController.text)) {
      return "invalid password";
    }
    if (confirmNewPasswordController.text != newPasswordController.text) {
      return "password not match";
    }
    return null;
  }

  _resetPasswordValidationForm() {
    if (newPasswordFormKey.currentState!.validate()) {
      emit(SuccessInputValidation());
      isButtonEnabled = true;
      return true;
    }
    isButtonEnabled = false;
    emit(FailInputValidation());
    return false;
  }

  void doAction(ForgetPasswordActions action) {
    switch (action) {
      case InitialScreenAction():
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
      case VerifyOtpCodeAction():
        _verifyOtpCode(action.otp!);
        break;
      case GotToNextStateAction():
        _goToNextState();
        break;
      case GoToPreviousStatAction():
        _goToPreviousState();
        break;
      case ResetPasswordAction():
        _resetPassword();
        break;
      case ChangePasswordVisibilityAction():
        _changePasswordVisibility();
        break;
      case ValidateNewPasswordFieldsAction():
        _resetPasswordValidationForm();
        break;
      case CheckPasswordValidation():
        _resetPasswordValidationForm();
        break;
    }
  }
}

enum CurrentScreenState {
  CheckEmailScreen,
  OtpVerificationScreen,
  ResetPasswordScreen
}
