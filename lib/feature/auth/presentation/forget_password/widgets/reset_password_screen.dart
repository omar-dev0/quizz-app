import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/reset_password_form.dart';
import '../../../../../core/resources/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: context.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text("Reset password", style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,),
              const SizedBox(height: 16,),
              const Text(
                "Password must not be empty and must contain 6 characters with upper case letter and one number at least",
                textAlign: TextAlign.center,),
              const SizedBox(height: 32,),
              const ResetPasswordForm(),
              const SizedBox(height: 48),
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  onPressed:()=>viewModel.doAction(ResetPasswordAction()), child:
                Text(
                  "Continue",
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.white),
                ),
                ),),
            ],
        ),
      ),
    );
  }
}
