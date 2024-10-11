import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/otp_verification_screen.dart';
import 'forget_password_screen_State.dart';

class ForgetPasswordViewModel extends Cubit<ForgetPasswordScreenState>{
  ForgetPasswordViewModel(super.initialState);


  void navigateToOtpConfirmationScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const OtpVerificationScreen()));
  }
}

