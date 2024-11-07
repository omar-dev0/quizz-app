import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/custom_search_bar.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subjects_bloc.dart';

import '../manager/home_managers/home_screen_actions.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    homeViewModel.doAction(GetSubjectsAction());
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                 CustomSearchBar(),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Browse by subject",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.black, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 24,),
                const SubjectsBloc(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
