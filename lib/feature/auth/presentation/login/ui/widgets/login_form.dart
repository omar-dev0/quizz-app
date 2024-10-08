import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Form(
        child: Column(
          children: [
            CustomInputField(hintText: "Enter your email", labelText: "Email",),
            SizedBox(height: 24,),
            CustomInputField(hintText: "Enter your password", labelText: "Password",),
          ],
        )
    );
  }
}
