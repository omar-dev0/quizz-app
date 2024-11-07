import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/local/local.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/forget_password_screen.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_row.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';

class RememberMeAndForgotPasswordRow extends StatelessWidget {
  const RememberMeAndForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return BlocListener<LoginViewModel, LoginScreenState>(
      listener: (context,state){
        if(state is NavigateToForgetPasswordScreenState){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> ForgetPasswordScreen()));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RememberMeRow(),
          TextButton(
            onPressed: () {
               loginViewModel.doAction(ForgetPasswordNavigatorAction());
            },
            child: Text(
              AppStrings.forgetPassword,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontSize: 12, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
