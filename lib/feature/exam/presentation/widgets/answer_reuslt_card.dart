import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors.dart';

class AnswerReusltCard extends StatelessWidget {
  final String answer;
  final Color borderColor;
  const AnswerReusltCard({super.key, required this.answer, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 12,bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: borderColor,
        border: Border.all(
          color: borderColor
        )
      ),
      child: Text(answer, style: Theme.of(context).textTheme.labelMedium,),
    );
  }
}
