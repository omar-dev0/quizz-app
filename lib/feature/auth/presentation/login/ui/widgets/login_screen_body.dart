import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/local/local.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/login_button.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/remember_me_and_forgot_password_row.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_actions.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_screen_state.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/pages/home.dart';
import 'package:quizz_app/feature/exam/presentation/pages/main_screen.dart';
import '../../../../../../core/resources/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    return BlocConsumer<LoginViewModel, LoginScreenState>(
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
                        loginViewModel.doAction(InitialScreenAction());
                        Navigator.pop(context);
                      },
                      child: const Text(AppStrings.cancel),
                    )
                  ],
                );
              });
        }
        else if (state is CloseDialog)
          {
            Navigator.pop(context);
          }
        else if (state is LoginErrorState) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: AppColors.error,
                  title: Text(
                    state.message!,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.white),
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        loginViewModel.doAction(InitialScreenAction());
                      },
                      child: const Text(AppStrings.cancel),
                    )
                  ],
                );
              });
        }
        else if (state is LoginSuccessState) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> MainScreen(user: state.user!)));
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
        return  Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const LoginForm(),
              SizedBox(
                height: 16.h,
              ),
              const RememberMeAndForgotPasswordRow(),
              SizedBox(
                height: 48.h,
              ),
              const LoginButton()
            ],
          ),
        );
      },
    );
  }
}
