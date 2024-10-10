import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/login_button.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_and_forgot_password_row.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/shared_widgets/dialogs.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginViewModel, LoginScreenState>(
      builder: (context, state) {
        if(state is LoadingState){
          return const CircularProgressIndicator();
        }else if(state is LoginErrorState){
          return const AlertDialog(
            backgroundColor: AppColors.error,
            title: Text("Something went wrong"),
            actions: [

            ],
          );
        }
        return const Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              LoginForm(),
              SizedBox(
                height: 16,
              ),
              RememberMeAndForgotPasswordRow(),
              SizedBox(
                height: 48,
              ),
              LoginButton()
            ],
          ),
        );
      },
    );
  }
}
