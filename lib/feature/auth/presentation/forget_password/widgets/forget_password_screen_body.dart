import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_screen_State.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/otp_verification_screen.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/reset_password_screen.dart';

import 'check_email_screen.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordScreenState>(
      builder: (context, state){
       late Widget currentBodyWidget;
        switch (state) {
          case InitialScreenState():
             currentBodyWidget = const CheckEmailScreen();
             break;
          case NavigateToEmailVerificationScreenState():
            currentBodyWidget = const OtpVerificationScreen();
            break;
          case NavigateToResetPasswordScreenState():
             currentBodyWidget = const ResetPasswordScreen();
             break;
          default:
            currentBodyWidget = const CheckEmailScreen();

        }
        return currentBodyWidget;
      },
      listener:(context,state){} ,
    );
  }
}
