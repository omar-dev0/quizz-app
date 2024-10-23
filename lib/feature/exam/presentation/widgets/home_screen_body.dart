import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subject_item.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
         const SearchBar(),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Browse by subject",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.black),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 24,),
          const SubjectItem(),
          const SubjectItem(),
          const SubjectItem(),
          const SubjectItem(),
        ],
      ),
    );
  }
}
