import 'package:flutter/material.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_row.dart';

class RememberMeAndForgotPasswordRow extends StatelessWidget {
  const RememberMeAndForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RememberMeRow(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forget password?",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontSize: 12, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
