import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/pages/home.dart';

import '../../../../core/di/di.dart';
import '../manager/home_managers/view_model.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  final homeViewModel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> homeViewModel,
      child: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
