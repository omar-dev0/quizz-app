import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/home_screen_body.dart';

import '../../../../core/di/di.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final homeViewModel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(_)=> homeViewModel ,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Servey",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.primary),
          ),
        ),
        body: const SafeArea(
          child: HomeScreenBody(),
        ),

      ),
    );
  }
}
