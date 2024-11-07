
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import '../../../domain/model/user.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_actions.dart';

class LoginActionHandler {
  final LoginUseCase loginUseCase;
  final LoginViewModel loginViewModel;
  late User user;
  late String? errorMessage;
  LoginActionHandler(this.loginUseCase,
      this.loginViewModel);

  void handleAction(LoginScreenActions action) {
    switch (action) {
      case LoginAction():
        _login();
        break;
      case ForgetPasswordNavigatorAction():
        _navigateToForgetPassword();
        break;
      case CheckedBoxAction():
        _handleCheckboxAction(action);
      case LoginFormInputValidate():
        break;
      case InitialScreenAction():
        loginViewModel.emitState(InitialScreenState());
      case ClickedSignUpButton():
       _navigateToSignUp();
           break;
    }
  }

  void _login() async {
    loginViewModel.emitState(LoadingState());
    String email = loginViewModel.controllersManager.emailController.text;
    String password =loginViewModel.controllersManager.passwordController.text;
    final response = await loginUseCase.invoke(email,password);
    switch (response) {
      case Success():
        {
          User user = User(email: email, token: response.data!.token);
          loginViewModel.emitState(CloseDialog());
          loginViewModel.emitState(LoginSuccessState(user));
        }
      case ServerFailure():
        {
          loginViewModel.emitState(CloseDialog());
          loginViewModel.emitState(LoginErrorState(response.message));
        }
      case Fail():
        {
          loginViewModel.emitState(CloseDialog());
          loginViewModel.emitState(LoginErrorState(response.error));
        }
    }

  }

  void _navigateToForgetPassword(){
    loginViewModel.emitState(NavigateToForgetPasswordScreenState());
  }
  void _handleCheckboxAction(CheckedBoxAction action) {
    loginViewModel.emitState(RememberMeBoxCheckedState(action.isBoxChecked));
  }

  void _navigateToSignUp(){
    loginViewModel.emitState(NavigateToSignUp());
    loginViewModel.emitState(InitialScreenState());
  }
}
