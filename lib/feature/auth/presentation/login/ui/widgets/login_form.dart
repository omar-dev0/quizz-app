import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/local/local.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/validate_manager.dart';
import 'custom_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return Form(
      key: loginViewModel.getLoginFormKey(),
      child: Column(
        children: [
          CustomInputField(
            hintText: AppStrings.enterYourEmail,
            labelText: AppStrings.email,
            validator: (value) {
              loginViewModel.setEmailValue(value.toString());
              log("Email checker: $value");
              return ValidateManger.isEmailInputFieldEmpty(value);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomInputField(
            hintText: AppStrings.enterYourPassword,
            labelText: AppStrings.password,
            validator: (value) {
              loginViewModel.setPasswordValue(value.toString());
              log("password checker: $value");
              return ValidateManger.isPasswordInputFieldEmpty(value);
            },
          ),
        ],
      ),
    );
  }
}
