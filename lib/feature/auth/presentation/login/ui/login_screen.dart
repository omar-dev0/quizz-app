import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/widgets/login_screen_body.dart';
import 'package:quizz_app/feature/auth/presentation/login/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
 final LoginViewModel viewModel = getIt.get<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new),
          titleSpacing: -8,
          title: Text(
            "Login",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: SafeArea(child: LoginScreenBody()),
      ),
    );
  }
}
