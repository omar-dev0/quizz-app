import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/home_widgets/custom_bottom_navigation_bar.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/home_widgets/home_screen_body.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/profile_fragment.dart';
import 'package:quizz_app/feature/exam/presentation/pages/resulte_fragment.dart';

import '../manager/home_managers/home_screen_states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});


  List<Widget> body = [
    const HomeScreenBody(),
    const ResulteFragment(),
    const ProfileFragment()
  ];

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    return Scaffold(
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
        body: BlocConsumer<HomeViewModel,HomeScreenStates>(
          builder: (context,state){
             if(state is ChangeHomeCurrentFragmentState){
               log(body[homeViewModel.getCurrentFragmentIndex()].toString());
               return body[homeViewModel.getCurrentFragmentIndex()];
             }
             return body[0];
          },
          listener: (context,state){

          },
        ),
      bottomNavigationBar:  CustomBottomNavigationBar(),
    );
  }
}
