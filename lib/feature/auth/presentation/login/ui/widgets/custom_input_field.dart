import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  const CustomInputField({super.key, required this.hintText,required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
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
