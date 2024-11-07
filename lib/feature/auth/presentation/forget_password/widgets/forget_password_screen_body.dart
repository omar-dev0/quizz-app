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
      builder: (context, state){
        Widget currentBodyWidget = const CheckEmailScreen();
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
       listenWhen: (previous,current){
        if(current is NavigateBackState){
          if(previous is NavigateToResetPasswordScreenState) {
            forgetPasswordViewModel.doAction(NavigateToVerificationEmailScreenAction());
          }else if(previous is NavigateToEmailVerificationScreenState){
             forgetPasswordViewModel.doAction(InitialScreenAction());
          }else if(previous is InitialScreenState){
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen()));
          }
        }
        return true;
      },
    );
  }
}
