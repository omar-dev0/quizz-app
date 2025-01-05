import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_screen_State.dart';
import 'package:quizz_app/feature/exam/presentation/manager/reset_password/reset_password_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/reset_password/reset_password_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/reset_password/reset_password_view_model.dart';

class ResetPasswordScreenUi extends StatelessWidget {
  ResetPasswordScreenUi({super.key});

  final viewModel = getIt.get<ResetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reset password"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<ResetPasswordViewModel, ResetPasswordState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            _buildPasswordTextField(
                                "Current Password",
                                viewModel.currentPasswordController,
                                ResetPasswordFormFields.currentPassword,
                                viewModel.isPasswordObscure),
                            SizedBox(height: 10.h),
                            _buildPasswordTextField(
                                "New Password",
                                viewModel.newPasswordController,
                                ResetPasswordFormFields.newPassword,
                                viewModel.isPasswordObscure),
                            SizedBox(height: 10.h),
                            _buildPasswordTextField(
                                "Confirm Password",
                                viewModel.confirmPasswordController,
                                ResetPasswordFormFields.confirmPassword,
                                viewModel.isPasswordObscure),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: viewModel.isActiveButton
                              ? () {
                                  viewModel.doAction(UpdatePasswordAction());
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: AppColors.grey,
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ), // Button color
                          ),
                          child: const Text(
                            "Update",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
          listener: (context, state) {
            if (state is SuccessState) {
            } else if (state is LoadingState) {
            } else if (state is FailureState) {}
          },
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(String label, TextEditingController controller,
      ResetPasswordFormFields field, bool isObscure) {
    return TextFormField(
      validator: (value) => viewModel.validatePassword(field),
      onChanged: (value) {
        viewModel.doAction(ValidateFieldsAction());
      },
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            Icons.visibility,
            color: isObscure ? AppColors.grey : AppColors.primary,
          ),
          onPressed: () {
            viewModel.doAction(ChangePasswordObscureAction());
          },
        ),
        labelText: label,
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
