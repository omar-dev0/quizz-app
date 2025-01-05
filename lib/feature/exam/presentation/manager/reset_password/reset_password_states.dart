class ResetPasswordState{}
class InitialState extends ResetPasswordState{}
class LoadingState extends ResetPasswordState{}
class SuccessState extends ResetPasswordState{
  final String? message;
  SuccessState({this.message});
}
class FailureState extends ResetPasswordState{
  final String? message;
  FailureState({this.message});
}
class ValidationState extends ResetPasswordState{}
class SuccessValidationState extends ResetPasswordState{}
class FailureValidationState extends ResetPasswordState{}
class PasswordObscureState extends ResetPasswordState{}