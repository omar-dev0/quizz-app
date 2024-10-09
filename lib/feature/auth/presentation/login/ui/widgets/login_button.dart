import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import '../../../../../../core/resources/colors.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});


  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return Column(
      children: [
        SizedBox(
          width: context.width,
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {
              FocusScope.of(context).unfocus();
              if(formKey.currentState?.validate() ?? false){
                loginViewModel.doAction(LoginAction());
              }else{
                loginViewModel.emitState(EmptyFiledState("Required"));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextButton(
              onPressed: (){

              },
              child: Text(
                "Signup",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(decoration: TextDecoration.underline, color: AppColors.primary),
              ),
            )
          ],
        )
      ],
    );
  }
}
