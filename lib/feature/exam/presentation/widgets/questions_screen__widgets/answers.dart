import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/choice_item_card.dart';

class Answers extends StatefulWidget {
  final List<ExamQuestionsEntity> questions;

  const Answers({super.key, required this.questions});

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionsScreenViewModel>();
    int currentQuestion = viewModel.getCurrentQuestion();

    return SizedBox(
      height: 380,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.questions[currentQuestion].answers!.length,
        itemBuilder: (context, index) {
          final answer = widget.questions[currentQuestion].answers![index];
          viewModel.doAction(GetQuestionTypeAction(widget.questions[currentQuestion].type!));
          return ChoiceItemCard(
            answer: answer,
            isSelected: _selectedAnswer == answer.answer,
            onSelected: (selectedAnswer) {
              setState(() {
                _selectedAnswer = selectedAnswer;
              });
            },
          );
        },
      ),
    );
  }
}
