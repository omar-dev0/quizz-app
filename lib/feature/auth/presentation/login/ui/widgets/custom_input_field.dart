import 'package:flutter/material.dart';
import 'package:quizz_app/core/resources/colors.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  const CustomInputField({super.key, required this.hintText,required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
