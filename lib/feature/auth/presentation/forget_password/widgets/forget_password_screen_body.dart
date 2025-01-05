import 'dart:developer';

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
        switch (forgetPasswordViewModel.currentScreenState) {
          case CurrentScreenState.CheckEmailScreen:
             currentBodyWidget = const CheckEmailScreen();
             break;
          case CurrentScreenState.OtpVerificationScreen:
            currentBodyWidget = const OtpVerificationScreen();
            break;
          case CurrentScreenState.ResetPasswordScreen:
             currentBodyWidget = const ResetPasswordScreen();
             break;
        }
        log(currentBodyWidget.toString());
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
          forgetPasswordViewModel.doAction(GotToNextStateAction());
        }
        if (currentSankBar != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(currentSankBar);
        }
        if(state is NavigateToLoginScreenState){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
        }
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
