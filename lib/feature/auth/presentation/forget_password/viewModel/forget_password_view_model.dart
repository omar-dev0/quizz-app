import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_action.dart';
import 'forget_password_action_handler.dart';
import 'forget_password_screen_State.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordScreenState>{
  late final ForgetPasswordActionHandler forgetPasswordActionHandler;
  ForgetPasswordViewModel(ForgetPasswordUseCase forgetPasswordUseCase) : super(InitialScreenState()){
    forgetPasswordActionHandler = ForgetPasswordActionHandler(this);
  }

  void emitState(state){
    emit(state);
  }

  void doAction(ForgetPasswordActions action){
    forgetPasswordActionHandler.handelActions(action);
  }

}

