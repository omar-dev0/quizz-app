import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/local/local.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/login_button.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_and_forgot_password_row.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import '../../../../../../core/resources/colors.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return BlocConsumer<LoginViewModel, LoginScreenState>(
      listenWhen: (previous, current) {
        if (previous is LoadingState || previous is LoginErrorState) {
          Navigator.pop(context);
        }
        return current is! InitialScreenState;
      },
      listener: (context, state) {
        if (state is LoadingState) {
          showDialog(
              context: context,
              builder: (_) {
                return  AlertDialog(
                  title: const CircularProgressIndicator(),
                  actions: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        loginViewModel.doAction(InitialScreenAction());
                      },
                      child: const Text(AppStrings.cancel),
                    )
                  ],
                );
              });
        } else if (state is LoginErrorState) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: AppColors.error,
                  title: Text(
                    state.message!,
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        loginViewModel.doAction(InitialScreenAction());
                      },
                      child: const Text(AppStrings.cancel),
                    )
                  ],
                );
              });
        } else if (state is LoginSuccessState) {
          showDialog(
            context: context,
            builder: (_) {
              return const AlertDialog(
                backgroundColor: Colors.green,
                title: Text("Success"),
                actions: [],
              );
            },
          );
        }else if(state is InitialScreenState){
           const Padding(
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
        }
      },
      builder: (BuildContext context, LoginScreenState state) {
        if(state is InitialScreenState){
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
