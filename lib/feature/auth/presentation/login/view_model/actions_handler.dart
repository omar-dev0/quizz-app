import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/auth/data/api/api_client.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password_screen.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import '../../../domain/model/user.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'controller_manger.dart';
import 'login_actions.dart';

class ActionHandler {
  final LoginUseCase loginUseCase;
  final ControllersManager controllersManager;
  final LoginViewModel loginViewModel;

  ActionHandler(this.loginUseCase, this.controllersManager,
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
    String email = controllersManager.emailController.text;
    String password = controllersManager.passwordController.text;
    log("email $email");
    log("password: $password");
    final response = await apiClient.login(email,password);
    log("responsedata ${response}");
    if(response == null){
       loginViewModel.emitState(LoginErrorState());
    }else{
      User user = User(email: email, token: response.token);
      loginViewModel.emitState(LoginSuccessState(user));
    }
  }

  void _navigateToForgetPassword(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen()));
}
  void _handleCheckboxAction(CheckedBoxAction action) {
    loginViewModel.emitState(RememberMeBoxCheckedState(action.isBoxChecked));
  }
}
