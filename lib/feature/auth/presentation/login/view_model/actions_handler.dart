import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/validate_manager.dart';
import '../../../domain/use_cases/login_use_case.dart';

import 'controller_manger.dart';
import 'login_actions.dart';

class ActionHandler {
  final LoginUseCase loginUseCase;
  final ControllersManager controllersManager;
  final LoginViewModel loginViewModel;
  ActionHandler(this.loginUseCase, this.controllersManager, this.loginViewModel);

  void handleAction(LoginScreenActions action) {
     switch (action) {
       case LoginAction():
         break;
       case ForgetPasswordAction():

         break;
       case CheckedBoxAction():
         _handleCheckboxAction(action);
       case LoginFormInputValidate():
         break;
     }
  }

  void _login() {

  }

  void _forgetPasswordAction() {

  }

  void _handleCheckboxAction(CheckedBoxAction action) {
    loginViewModel.emitState(RememberMeBoxCheckedState(action.isBoxChecked));
  }
}
