import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_screen_State.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';

import '../../../../../core/resources/colors.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();
    Color visibleIconColor = AppColors.grey;
    return BlocBuilder<ForgetPasswordViewModel, ForgetPasswordScreenState>(
      builder: (context, state) {
        if (state is ChangePasswordVisibilityState) {
          visibleIconColor =
              viewModel.isObscureText ? AppColors.grey: AppColors.primary;
        }
        return Form(
          key: viewModel.newPasswordFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: viewModel.newPasswordController,
                obscureText: viewModel.isObscureText,
                decoration: InputDecoration(
                  labelText: "New password",
                  hintText: "Enter your password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.doAction(ChangePasswordVisibilityAction());
                      },
                      icon: const Icon(Icons.visibility),color: visibleIconColor,),
                ),
                validator: (value) => viewModel.passwordValidation(),
                onChanged: (value) {
                  viewModel.doAction(ValidateNewPasswordFieldsAction());
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: viewModel.confirmNewPasswordController,
                obscureText: viewModel.isObscureText,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.doAction(ChangePasswordVisibilityAction());
                        },
                        icon: const Icon(Icons.visibility),color: visibleIconColor,),
                    labelText: "Confirm password",
                    hintText: "Confirm password"),
                validator: (value) => viewModel.confirmPasswordValidation(),
                onChanged: (value) {
                  viewModel.doAction(ValidateNewPasswordFieldsAction());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
