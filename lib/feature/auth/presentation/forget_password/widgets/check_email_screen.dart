import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_screen_State.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/otp_verification_screen.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordViewModel = context.read<ForgetPasswordViewModel>();
    return BlocListener<ForgetPasswordViewModel,ForgetPasswordScreenState>(
      listener: ( context,  state) {
        if(state is NavigateToEmailVerificationScreenState){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const OtpVerificationScreen()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Forget password",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Please enter your email associated to your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your email", labelText: "Email"),
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                    onPressed: () {
                      forgetPasswordViewModel.doAction(NavigateToVerificationEmailScreenAction());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Continue",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
