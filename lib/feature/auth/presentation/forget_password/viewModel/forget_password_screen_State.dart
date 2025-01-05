sealed class ForgetPasswordScreenState{}

class InitialForgetPasswordScreenState extends ForgetPasswordScreenState{}
class NavigateToEmailVerificationScreenState extends ForgetPasswordScreenState{}
class NavigateToResetPasswordScreenState extends ForgetPasswordScreenState{}
class NavigateToLoginScreenState extends ForgetPasswordScreenState{}
class NavigateBackState extends ForgetPasswordScreenState{}
class ForgetPasswordSuccessState extends ForgetPasswordScreenState{
  String? message;
  ForgetPasswordSuccessState(this.message);
}
class ForgetPasswordFailState extends ForgetPasswordScreenState{
  String? message;
  ForgetPasswordFailState(this.message);
}
class ForgetPasswordLoadingState extends ForgetPasswordScreenState{
}
class SuccessInputValidation extends ForgetPasswordScreenState{}
class FailInputValidation extends ForgetPasswordScreenState {}
class GoToNextState extends ForgetPasswordScreenState{}
class PreviousState extends ForgetPasswordScreenState{}
class ChangePasswordVisibilityState extends ForgetPasswordScreenState{}