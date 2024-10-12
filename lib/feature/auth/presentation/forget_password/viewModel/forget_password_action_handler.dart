import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_screen_State.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';

class ForgetPasswordActionHandler{
  late ForgetPasswordViewModel forgetPasswordViewModel;

  ForgetPasswordActionHandler(this.forgetPasswordViewModel);

  void handelActions(ForgetPasswordActions action){
    switch (action) {
      case NavigateToVerificationEmailScreenAction():
        forgetPasswordViewModel.emitState(NavigateToEmailVerificationScreenState());
        break;
      case NavigateToResetPasswordScreenAction():
        forgetPasswordViewModel.emitState(NavigateToResetPasswordScreenState());
    }
  }
}