import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({super.key});

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
   LoginViewModel viewModel = context.read<LoginViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
            value: viewModel.getRememberMeBoxState(),
            onChanged: (value) {
              setState(() {
                isChecked = value?? false;
                viewModel.doAction(CheckedBoxAction(isChecked));
              });
            }),
        Text(
          "Remember me",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 13),

        )
      ],
    );
  }
}
