import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domain;
import 'package:quizz_app/feature/exam/presentation/pages/home.dart';

import '../../../../core/di/di.dart';
import '../manager/home_managers/view_model.dart';

class MainScreen extends StatelessWidget {
  static const String route = "MainScreen";
   final domain.User user;
   MainScreen({super.key,required this.user});
  final homeViewModel = getIt.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        homeViewModel.setUser(user);
       return homeViewModel;
      },
      child: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
