sealed class RegistrationState {}

class InitReg extends RegistrationState {}

class LoadingReg extends RegistrationState {}

class SuccessReg extends RegistrationState {}

class FailReg extends RegistrationState {
  String? error;
  FailReg({this.error});
}
