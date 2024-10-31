import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors.dart';

class ExamImageTitleRow extends StatelessWidget {
  final String examTitle;
  const ExamImageTitleRow({super.key, required this.examTitle});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Image.asset(ImageAssets.examItemImage,height:47, width: 42,),
        const SizedBox(width: 8,),
        Text(
          examTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
