import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_screen_State.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';

class ForgetPasswordActionHandler{
  final ForgetPasswordViewModel forgetPasswordViewModel;
   final ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordActionHandler(this.forgetPasswordViewModel, this.forgetPasswordUseCase);

  void handelActions(ForgetPasswordActions action){
    switch (action) {
      case NavigateToVerificationEmailScreenAction():
        forgetPasswordViewModel.emitState(NavigateToEmailVerificationScreenState());
        break;
      case NavigateToResetPasswordScreenAction():
        forgetPasswordViewModel.emitState(NavigateToResetPasswordScreenState());
      case NavigateBackAction():
        forgetPasswordViewModel.emitState(NavigateBackState());
      case InitialScreenAction():
        forgetPasswordViewModel.emitState(InitialScreenState());
      case NavigateToLoginScreenAction():
        forgetPasswordViewModel.emitState(NavigateToLoginScreenState());
      case SentOtpCodeAction():
    }

    void _getOtpCode(String email)async{

      final response = await forgetPasswordUseCase.invoke(email);
      switch (response) {
        case Success():
            forgetPasswordViewModel.emitState(OtpSendingSuccess(response.data!.message));
        case Fail():
            forgetPasswordViewModel.emitState(OtpSendingFail(response.error.toString()));
      }
    }
  }
}