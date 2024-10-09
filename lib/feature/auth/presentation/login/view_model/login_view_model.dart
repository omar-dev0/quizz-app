import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';

import 'login_screen_state.dart';


@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase) : super(InitialScreenState());

   bool _isRememberMeBoxChecked = false;
   void _setRememberMeBoxState(bool isRememberMeBoxChecked){
     _isRememberMeBoxChecked = isRememberMeBoxChecked;
   }
   bool getRememberMeBoxState(){
     return _isRememberMeBoxChecked;
   }

  void doAction(Actions action){
    switch (action) {
      case LoginAction():
        _login(action);
        break;
      case ForgetPasswordAction():
        _forgetPasswordAction();
        break;
      case CheckedBoxAction():_isCheckedBox(action);
    }
  }

  void _isCheckedBox(CheckedBoxAction action){
    emit(RememberMeCheckedBoxState());
    _setRememberMeBoxState(action.isBoxChecked);
  }

  void _login(LoginAction action){}

  void _forgetPasswordAction(){}

}