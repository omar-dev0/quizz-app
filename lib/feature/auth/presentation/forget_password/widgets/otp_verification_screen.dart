import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/otp_code_row.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Email verification",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Please enter your code that send to your email address",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 32,
            ),
            const OtpCodeRow(),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive code? ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.black),
                ),
                Text(
                  "Resend ",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
