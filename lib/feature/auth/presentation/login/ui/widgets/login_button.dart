import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/local/local.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import '../../../../../../core/resources/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return Column(
      children: [
        BlocBuilder<LoginViewModel,LoginScreenState>(builder: (context, state) {
          ButtonStyle? style = Theme.of(context).elevatedButtonTheme.style;
          if(state is EmptyFiledState){
            style = Theme.of(context).elevatedButtonTheme.style?.copyWith(backgroundColor: const WidgetStatePropertyAll(AppColors.grey10));
          }
          return SizedBox(
            width: context.width,
            child: ElevatedButton(
              style: style,
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (loginViewModel.getLoginFormKey().currentState?.validate() ??
                    false) {
                  loginViewModel.doAction(LoginAction());
                } else {
                  loginViewModel.emitState(EmptyFiledState());
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  AppStrings.login,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: AppColors.white),
                ),
              ),
            ),
          );
        }),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.donotHaveAnAccount,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.signUp,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.primary),
              ),
            )
          ],
        )
      ],
    );
  }
}
