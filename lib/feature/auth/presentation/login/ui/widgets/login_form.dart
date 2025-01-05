import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/local/local.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/validate_manager.dart';
import 'package:retrofit/http.dart';
import 'custom_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    bool isPasswordObscure = loginViewModel.isObscureText;
    List<Color> passwordIconColor = [AppColors.primary,AppColors.grey];
    Color currentColor = passwordIconColor[isPasswordObscure == false? 0 : 1];
    return BlocListener<LoginViewModel, LoginScreenState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          loginViewModel.controllersManager.emailController.text = "";
          loginViewModel.controllersManager.passwordController.text = "";
          ValidateManger.isEmailInputFieldEmpty(
              loginViewModel.controllersManager.emailController.text);
          ValidateManger.isEmailInputFieldEmpty(
              loginViewModel.controllersManager.passwordController.text);
        }
      },
      child: Form(
        key: loginViewModel.getLoginFormKey(),
        child: Column(
          children: [
            CustomInputField(
              hintText: AppStrings.enterYourEmail,
              labelText: AppStrings.email,
              validator: (value) {
                loginViewModel.setEmailValue(value.toString());
                return ValidateManger.isEmailInputFieldEmpty(value);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<LoginViewModel,LoginScreenState>(
              builder: (context,state){
                if(state is ChangePasswordVisibilityState){
                  isPasswordObscure = state.isObscureText;
                  currentColor = passwordIconColor[isPasswordObscure == false? 0 : 1];
                }
                return TextFormField(
                  obscureText: isPasswordObscure,
                  controller: loginViewModel.controllersManager.passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: () {
                      loginViewModel.doAction(ChangePasswordVisibilityAction());
                    }, icon:  Icon(Icons.remove_red_eye,color: currentColor,)),
                    labelText: AppStrings.password,
                    hintText: AppStrings.enterYourPassword,
                  ),
                  validator: (value) {
                    return ValidateManger.isPasswordInputFieldEmpty(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
