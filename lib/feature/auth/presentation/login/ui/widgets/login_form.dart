import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            hintText: "Enter your email",
            labelText: "Email",
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
            hintText: "Enter your password",
            labelText: "Password",
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
