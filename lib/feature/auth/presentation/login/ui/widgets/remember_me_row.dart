import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/local/local.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewModel viewModel = context.read<LoginViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<LoginViewModel, LoginScreenState>(
            builder: (context, state) {
          bool isChecked = false;
          if (state is RememberMeBoxCheckedState) {
            isChecked = state.isChecked;
          }
          return Checkbox(
            value: isChecked,
            onChanged: (value) {
              viewModel.doAction(
                CheckedBoxAction(value ?? false),
              );
            },
          );
        }),
        Text(
          AppStrings.rememberMe,
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 13),
        )
      ],
    );
  }
}
