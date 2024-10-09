import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/login_button.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_and_forgot_password_row.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
   const LoginScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          LoginForm(),
          SizedBox(
            height: 16,
          ),
          RememberMeAndForgotPasswordRow(),
          SizedBox(
            height: 48,
          ),
           LoginButton()
        ],
      ),
    );
  }
}
