import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/forget_password_use_case.dart';

import '../widgets/otp_verification_screen.dart';
import 'forget_password_screen_State.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordScreenState>{
  ForgetPasswordViewModel(ForgetPasswordUseCase forgetPasswordUseCase) : super(InitialScreenState());

  void navigateToOtpConfirmationScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const OtpVerificationScreen()));
  }
}

