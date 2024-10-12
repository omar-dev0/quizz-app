
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/auth/data/api/api_client.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/forget_password_screen.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import '../../../domain/model/user.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_actions.dart';

class ActionHandler {
  final LoginUseCase loginUseCase;
  final LoginViewModel loginViewModel;
  late User user;
  late String? errorMessage;
  ActionHandler(this.loginUseCase,
      this.loginViewModel);

  void handleAction(LoginScreenActions action) {
    switch (action) {
      case LoginAction():
        _login();
        break;
      case ForgetPasswordNavigatorAction():
        _navigateToForgetPassword(action.context);
        break;
      case CheckedBoxAction():
        _handleCheckboxAction(action);
      case LoginFormInputValidate():
        break;
    }
  }

  Future<void> _login() async {
    loginViewModel.emitState(LoadingState());
    final ApiClient apiClient = ApiClient();
    String email = loginViewModel.controllersManager.emailController.text;
    String password =loginViewModel.controllersManager.passwordController.text;
    final response = await apiClient.login(email,password);
    if(response == null || response.code == 401){
       errorMessage = response?.message!;
       loginViewModel.emitState(LoginErrorState());
    }else{
       user = User(email: email, token: response.token);
      loginViewModel.emitState(LoginSuccessState(user));
    }
  }

  void _navigateToForgetPassword(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  ForgetPasswordScreen()));
}
  void _handleCheckboxAction(CheckedBoxAction action) {
    loginViewModel.emitState(RememberMeBoxCheckedState(action.isBoxChecked));
  }
}
