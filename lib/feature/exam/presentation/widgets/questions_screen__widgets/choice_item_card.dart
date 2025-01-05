import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';

import '../../../domain/entities/answer_entity.dart';

class ChoiceItemCard extends StatefulWidget {
  final AnswersEntity answer;
  final bool isSelected;
  final ValueChanged<int?> onSelected;
  final int index;
  final int answerIndex;
  const ChoiceItemCard({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onSelected,
    required this.index,
    required this.answerIndex,
  });

  @override
  State<ChoiceItemCard> createState() => _ChoiceItemCardState();
}

class _ChoiceItemCardState extends State<ChoiceItemCard> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionsScreenViewModel>();
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(17.5),
      height: 72.h,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(spreadRadius: 0, blurRadius: 0)],
        borderRadius: BorderRadius.circular(10),
        color: widget.isSelected ? AppColors.blue10: AppColors.lightBlue,
      ),
      child: Row(
        children: [
          BlocBuilder<QuestionsScreenViewModel, QuestionsScreenStates>(
            builder: (context, state) {
              log("answer ${widget.answerIndex}");
              log("question ${widget.index}");
              if (state is MultipleChoiceQuestionState) {
                return Checkbox(
                  value: widget.isSelected,
                  onChanged: (value) {
                  },
                );
              } else {
                return Radio<int>(
                  value: widget.answerIndex,
                  groupValue: viewModel.groupedValue[widget.index],
                  onChanged: widget.onSelected,
                );
              }
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.answer.answer ?? "",
              softWrap: true,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
