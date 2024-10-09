import '../../../domain/use_cases/login_use_case.dart';
import 'RememberMeanger.dart';
import 'login_actions.dart';

class ActionHandler {
  final LoginUseCase loginUseCase;
  final RememberMeManager rememberMeManager;

  ActionHandler(this.loginUseCase, this.rememberMeManager);

  void handleAction(LoginScreenActions action) {
     switch (action) {
       case LoginAction():
         // TODO: Handle this case.
       case ForgetPasswordAction():
         // TODO: Handle this case.
       case CheckedBoxAction():
         // TODO: Handle this case.
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
