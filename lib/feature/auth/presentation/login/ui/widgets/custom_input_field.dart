import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  
  const CustomInputField({super.key, required this.hintText,required this.labelText});

  @override
  Widget build(BuildContext context) {
    LoginViewModel  viewModel = context.read<LoginViewModel>();
    return TextField(
      controller: viewModel.getFieldController(labelText),
      obscureText: labelText == 'Password',
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(color: AppColors.grey),
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
      ),
    );
  }
}
