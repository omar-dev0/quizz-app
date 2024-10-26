import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/home_screen_body.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/profile_fragment.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/resulte_fragment.dart';

import '../../../../core/di/di.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeViewModel = getIt<HomeViewModel>();
  List<Widget> body = [
    const HomeScreenBody(),
    const ResulteFragment(),
    const ProfileFragment()
  ];

  @override
  Widget build(BuildContext context) {
    homeViewModel.doAction(GetSubjectsAction());
    return BlocProvider(
      create: (_) => homeViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Servey",
            style: Theme
                .of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.primary),
          ),
        ),
        body: BlocBuilder<HomeViewModel,HomeScreenStates>(
          builder: (context,state){
             if(state is ChangeHomeCurrentFragmentState){
               return body[homeViewModel.getCurrentFragmentIndex()];
             }
             return body[0];
          },
        ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
