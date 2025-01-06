import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();
    return Form(
      key: viewModel.newPasswordFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: viewModel.newPasswordController,
            decoration:  InputDecoration(
              labelText: "New password",
              hintText: "Enter your password",
              suffixIcon: IconButton(onPressed: (){

              }, icon: Icon(Icons.remove_red_eye)),
            ),

            validator: (value)=> viewModel.passwordValidation(),
            onChanged: (value){

            },
          ),
          const SizedBox(height: 24,),
          TextFormField(
            controller: viewModel.confirmNewPasswordController,
            decoration: const InputDecoration(
                labelText: "Confirm password",
                hintText: "Confirm password"
            ),
            validator: (value)=> viewModel.confirmPasswordValidation(),
            onChanged: (value){

            },
          ),
        ],
      ),
    );
  }
}
