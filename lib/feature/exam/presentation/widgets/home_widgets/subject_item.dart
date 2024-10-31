import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_managers/view_model.dart';

import '../../manager/home_managers/home_screen_actions.dart';


class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    int index = homeViewModel.getCurrentSubjectListIndex();
    return InkWell(
      onTap: () {
        homeViewModel.doAction(NavigateToSubjectExamsAction(index));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: context.width,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: Image.network(
                  homeViewModel.actionHandler.subjectsList[index].icon!),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(homeViewModel.actionHandler.subjectsList[index].name!,
                style: Theme.of(context).textTheme.labelMedium)
          ],
        ),
      ),
    );
  }
}
