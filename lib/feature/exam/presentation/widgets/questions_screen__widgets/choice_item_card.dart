import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';

import '../../../domain/entities/answer_entity.dart';

class ChoiceItemCard extends StatelessWidget {
  final AnswersEntity answer;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const ChoiceItemCard({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionsScreenViewModel>();
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(17.5),
      height: 72,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(spreadRadius: 0, blurRadius: 1)],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightBlue,
      ),
      child: Row(
        children: [
          BlocBuilder<QuestionsScreenViewModel, QuestionsScreenStates>(
            builder: (context, state) {
              if (state is MultipleChoiceQuestionState) {
                return Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    onSelected(answer.answer ?? "");
                  },
                );
              } else {
                return Radio<String>(
                  value: answer.answer ?? "",
                  groupValue: isSelected ? answer.answer : null,
                  onChanged: (value) {
                    onSelected(value!);
                    viewModel.setLastChoice(answer.key??"");
                  },
                );
              }
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              answer.answer ?? "",
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
