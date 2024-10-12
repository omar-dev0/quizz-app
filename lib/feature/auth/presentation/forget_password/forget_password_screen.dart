import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/forget_password/widgets/forget_password_screen_body.dart';
import '../../../../core/di/di.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  final forgetPasswordViewModel = getIt.get<ForgetPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> forgetPasswordViewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new),
          titleSpacing: -8,
          title: Text(
            "Password",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
         body: const ForgetPasswordScreenBody(),
      ),
    );
  }
}
