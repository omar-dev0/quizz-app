import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_screen_State.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/otp_verification_screen.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/reset_password_screen.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/login_screen.dart';

import 'check_email_screen.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordViewModel = context.read<ForgetPasswordViewModel>();
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordScreenState>(
      builder: (context, state) {
        Widget currentBodyWidget = const CheckEmailScreen();
        switch (state) {
          case InitialForgetPasswordScreenState():
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
      listener: (context, state) {
        var currentSankBar = null;
        if (state is ForgetPasswordLoadingState) {
          currentSankBar =  customStackBar(
              title: "Loading",
              content: "Sending Otp",
              contentType: ContentType.help);
        }
        if (state is ForgetPasswordFailState) {
          currentSankBar = customStackBar(
              title: "Error",
              content: state.message!,
              contentType: ContentType.failure);
        }
        if (state is ForgetPasswordSuccessState) {
          currentSankBar =  customStackBar(
              title: "Success",
              content: "Otp sent successfully",
              contentType: ContentType.success);
          forgetPasswordViewModel.doAction(NavigateToVerificationEmailScreenAction());
        }
        if (currentSankBar != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(currentSankBar);
        }
      },
      listenWhen: (previous, current) {
        if (current is NavigateBackState) {
          if (previous is NavigateToResetPasswordScreenState) {
            forgetPasswordViewModel
                .doAction(NavigateToVerificationEmailScreenAction());
          } else if (previous is NavigateToEmailVerificationScreenState) {
            forgetPasswordViewModel.doAction(InitialScreenAction());
          } else if (previous is InitialForgetPasswordScreenState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginScreen()));
          }
        }
        return true;
      },
    );
  }

  Widget customStackBar({required String title, required String content, required ContentType contentType}) {
     return  SnackBar(
       elevation: 0,
       backgroundColor: Colors.transparent,
       behavior: SnackBarBehavior.floating,
       content: AwesomeSnackbarContent(title: title, contentType: contentType, message: content,),
     );
  }

}
