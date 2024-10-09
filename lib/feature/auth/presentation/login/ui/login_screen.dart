import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        titleSpacing: -8,
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: const SafeArea(child: LoginScreenBody()),
    );
  }
}
