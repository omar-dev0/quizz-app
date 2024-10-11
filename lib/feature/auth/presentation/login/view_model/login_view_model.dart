import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/form_key_manager.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'actions_handler.dart';
import 'controller_manger.dart';
import 'login_actions.dart';
import 'login_screen_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  final ControllersManager controllersManager;
  final FormKeyManager formKeyManager;
  late final ActionHandler actionHandler;

  LoginViewModel(LoginUseCase loginUseCase)
      : controllersManager = ControllersManager(), formKeyManager  = FormKeyManager(),
        super(InitialScreenState()) {
    actionHandler = ActionHandler(
        loginUseCase, this);
  }

  TextEditingController getFieldController(String field) {
    return controllersManager.getFieldController(field);
  }

  void setEmailValue(String email) {
    controllersManager.setEmailControllerValue(email);
  }

  void setPasswordValue(String password) {
    controllersManager.setPasswordControllerValue(password);
  }

  GlobalKey<FormState> getLoginFormKey(){
    return formKeyManager.getLoginFormKey();
  }

  void emitState(LoginScreenState state){
     emit(state);
  }

  void doAction(LoginScreenActions action) {
    actionHandler.handleAction(action);
  }
}
