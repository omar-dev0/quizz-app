import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/assets_manger.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/login_screen.dart';
import 'package:quizz_app/feature/auth/presentation/registration/viewmodel/registration_cubit.dart';
import 'package:quizz_app/feature/auth/presentation/registration/viewmodel/registration_events.dart';
import 'package:quizz_app/feature/auth/presentation/registration/viewmodel/state.dart';
import 'package:quizz_app/feature/auth/presentation/registration/widget/sign_up_button.dart';

import '../../../../core/di/di.dart';
import '../../../../core/shared_widgets/dialogs.dart';

class RegistrationScreen extends StatelessWidget {
  static const String route = "registrationScreen";
  RegistrationScreen({super.key});
  final RegistrationViewModel signUpVm = getIt.get<RegistrationViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>signUpVm,
      child: BlocConsumer<RegistrationViewModel , RegistrationState>(
        listener: (context , state){
          if(state is FailReg)
            {
              Dialogs.alertDialog(
                  message: state.error ?? "",
                  animation: Lottie.asset(AnimationAssets.error),
                  negativeAction: (){Navigator.pop(context);},
                  negativeFeedback: 'OK',
                  context: context);
            }
          else if(state is NavigateToLogin)
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen()));
            }
          else if (state is SuccessReg)
            {
              Dialogs.successDialog(context: context);
            }
          else if (state is HideLoadingDialog)
            {
              Navigator.pop(context);
            }
          else if (state is LoadingReg)
            {
              Dialogs.loading(context: context);
            }
        },
        builder: (context , state)=> Scaffold(
          appBar: AppBar(
            title: Text(
              context.locals.signUp,
            ),
            centerTitle: false,
            leading: IconButton( onPressed : (){
              Navigator.pushReplacementNamed(context , LoginScreen.route);
            } , icon: const Icon(Icons.arrow_back_ios_new)),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.5.w),
            child: Form(
              key: signUpVm.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: signUpVm.validateEmpty,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: signUpVm.userName,
                    decoration: InputDecoration(
                        labelText: context.locals.userName,
                        hintText: context.locals.inputName),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: signUpVm.firstName,
                          validator: signUpVm.validateEmpty,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              labelText: context.locals.firstName,
                              hintText: context.locals.firstNameInput),
                        ),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: signUpVm.validateEmpty,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: signUpVm.lastName,
                          decoration: InputDecoration(
                              labelText: context.locals.lastName,
                              hintText: context.locals.lastNameInput),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    controller: signUpVm.email,
                    validator: signUpVm.emailValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: context.locals.email,
                        hintText: context.locals.inputEmail),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: signUpVm.password,
                          validator: signUpVm.validatePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: context.locals.password,
                              hintText: context.locals.inputPassword),
                        ),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Expanded(
                        child: TextFormField(
                          obscureText: true,
                          controller: signUpVm.rePassword,
                          validator: signUpVm.validateConfirmPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              labelText: context.locals.confirmPassword,
                              hintText: context.locals.confirmPassword),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    controller: signUpVm.phone,
                    validator: signUpVm.validateMobile,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: context.locals.phoneNumber,
                        hintText: context.locals.phoneInput),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  const SignUpButton(),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.locals.haveAccount,
                        style: context.appText.labelMedium,
                      ),
                      TextButton(
                          onPressed: () {
                            signUpVm.doEvent(SignInClicked());
                          },
                          child: Text(
                            context.locals.login,
                            style: context.appText.labelMedium?.copyWith(
                                color: context.appColors?.primary,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
