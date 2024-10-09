import '../../../domain/use_cases/login_use_case.dart';
import 'RememberMeanger.dart';
import 'login_actions.dart';

class ActionHandler {
  final LoginUseCase loginUseCase;
  final RememberMeManager rememberMeManager;

  ActionHandler(this.loginUseCase, this.rememberMeManager);

  void handleAction(LoginScreenActions action) {
    switch (action.runtimeType) {
      case LoginAction _:
        _login(action as LoginAction);
        break;
      case ForgetPasswordAction _:
        _forgetPasswordAction();
        break;
      case CheckedBoxAction _:
        _handleCheckboxAction(action as CheckedBoxAction);
        break;
      default:
        throw Exception("Unknown action");
    }
  }

  void _login(LoginAction action) {

  }

  void _forgetPasswordAction() {

  }

  void _handleCheckboxAction(CheckedBoxAction action) {
    rememberMeManager.setRememberMeBoxState(action.isBoxChecked);
  }
}
