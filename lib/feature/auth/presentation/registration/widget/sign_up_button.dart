

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/auth/presentation/registration/viewmodel/registration_cubit.dart';
import 'package:quizz_app/feature/auth/presentation/registration/viewmodel/state.dart';

import '../../../../../core/resources/colors.dart';
import '../viewmodel/registration_events.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationVm = context.read<RegistrationViewModel>();
    return BlocProvider(
      create: (context)=>registrationVm,
      child:   BlocBuilder<RegistrationViewModel , RegistrationState>(builder: (context, state) {
    ButtonStyle? style = Theme.of(context).elevatedButtonTheme.style;
    if(state is ErrorInField){
    style = Theme.of(context).elevatedButtonTheme.style?.copyWith(backgroundColor: const WidgetStatePropertyAll(AppColors.grey10));
    }
    return SizedBox(
    width: context.width,
    child: ElevatedButton(
    style: style,
    onPressed: () {
    FocusScope.of(context).unfocus();
    if (registrationVm.formKey.currentState?.validate() ?? false) {
    registrationVm.doEvent(SignUpClicked());
    } else {
    registrationVm.emitSate(ErrorInField());
    }
    },
    child: Text(
    context.locals.signUp,
    style: Theme.of(context)
        .textTheme
        .labelMedium
        ?.copyWith(color: AppColors.white),
    ),
    ),
    );
    }
    ));

  }
}
