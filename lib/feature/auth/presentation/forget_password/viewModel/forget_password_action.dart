
sealed class ForgetPasswordActions{}

class InitialScreenAction extends ForgetPasswordActions{}
class NavigateBackAction extends ForgetPasswordActions{}
class SentOtpCodeAction extends ForgetPasswordActions{}
class NavigateToLoginScreenAction extends ForgetPasswordActions{}
class CheckValidationInputAction extends ForgetPasswordActions{}
class VerifyOtpCodeAction extends ForgetPasswordActions{
  final String? otp;
  VerifyOtpCodeAction({this.otp});
}
class GotToNextStateAction extends ForgetPasswordActions{}
class GoToPreviousStatAction extends ForgetPasswordActions{}
class ResetPasswordAction extends ForgetPasswordActions{}
class ChangePasswordVisibilityAction extends ForgetPasswordActions{}
class ValidateNewPasswordFieldsAction extends ForgetPasswordActions{}