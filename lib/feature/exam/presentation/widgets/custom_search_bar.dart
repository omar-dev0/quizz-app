import 'package:flutter/material.dart';
import 'package:quizz_app/core/resources/colors.dart';


class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:InputDecoration(
        prefixIcon:  const Icon(Icons.search, color: AppColors.grey10,),
        hintText: "Search",
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.grey10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
    );
  }
}
