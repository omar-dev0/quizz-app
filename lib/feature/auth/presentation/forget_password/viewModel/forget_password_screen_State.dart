sealed class ForgetPasswordScreenState{}

class InitialScreenState extends ForgetPasswordScreenState{}
class NavigateToEmailVerificationScreenState extends ForgetPasswordScreenState{}
class NavigateToResetPasswordScreenState extends ForgetPasswordScreenState{}
class NavigateToLoginScreenState extends ForgetPasswordScreenState{}
class NavigateBackState extends ForgetPasswordScreenState{}
class OtpSendingSuccess extends ForgetPasswordScreenState{
  String? message;
  OtpSendingSuccess(this.message);
}
class OtpSendingFail extends ForgetPasswordScreenState{
  String? message;
  OtpSendingFail(this.message);
}