import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_row.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';

class RememberMeAndForgotPasswordRow extends StatelessWidget {
  const RememberMeAndForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RememberMeRow(),
        TextButton(
          onPressed: () {
             loginViewModel.doAction(ForgetPasswordNavigatorAction(context));
          },
          child: Text(
            "Forget password?",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontSize: 12, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
