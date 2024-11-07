import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "New password",
              hintText: "Enter your password"
            ),
          ),
          const SizedBox(height: 24,),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Confirm password",
                hintText: "Confirm password"
            ),
          ),
        ],
      ),
    );
  }
}
