import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/login_button.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_and_forgot_password_row.dart';

import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
   LoginScreenBody({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          LoginForm(formKey: formKey,),
          const SizedBox(
            height: 16,
          ),
          const RememberMeAndForgotPasswordRow(),
          const SizedBox(
            height: 48,
          ),
           LoginButton(formKey: formKey,)
        ],
      ),
    );
  }
}
