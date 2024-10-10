import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/check_email_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        titleSpacing: -8,
        title: Text(
          "Password",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: const CheckEmailScreen(),
    );
  }
}
