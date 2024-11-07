import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/auth/presentation/update_password/view_model/change_password_viewmodel.dart';
import 'package:quizz_app/feature/auth/presentation/update_password/view_model/state.dart';
import 'package:quizz_app/feature/auth/presentation/update_password/widgets/update_button_change_password.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  static const String route = 'changePassword';
  ChangePasswordViewModel changePasswordVm =
      getIt.get<ChangePasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => changePasswordVm,
      child: BlocConsumer<ChangePasswordViewModel, ChangePasswordSate>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                context.locals.resetPassword,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body:  Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: changePasswordVm.validateEmpty,
                      controller: changePasswordVm.currentPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: context.locals.currentPassword
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    TextFormField(
                      validator: changePasswordVm.validatePassword,
                      controller: changePasswordVm.newPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: context.locals.newPassword
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    TextFormField(
                      validator: changePasswordVm.validateConfirmPassword,
                      controller: changePasswordVm.rePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: context.locals.confirmPassword
                      ),
                    ),
                    SizedBox(height: 54.h,),
                    UpdateChangePasswordButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
