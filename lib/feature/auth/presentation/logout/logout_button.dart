import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/feature/auth/presentation/logout/view_model/logout_actions.dart';
import 'package:quizz_app/feature/auth/presentation/logout/view_model/logout_states.dart';
import 'package:quizz_app/feature/auth/presentation/logout/view_model/logout_view_model.dart';

import '../../../../core/shared_widgets/dialogs.dart';
import '../login/ui/login_screen.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({super.key});

  final viewModel = getIt.get<LogoutViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: SizedBox(
        width: double.infinity,
        child: BlocListener<LogoutViewModel, LogoutStates>(
          listener: (context, state) {
            switch (state) {
              case InitialState():
                break;
              case LogoutSuccessState():
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.route, // Navigate directly to the login screen
                    (route) => false, // Remove all previous routes
                  );
                });
                break;
              case LogoutFailedState():
                break;
              case LogoutLoadingState():
                Dialogs.logout(context: context);
                break;
            }
          },
          child: ElevatedButton(
            onPressed: () {
              viewModel.doAction(LogoutNeededAction());
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              backgroundColor: Colors.red, // Button color
            ),
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
