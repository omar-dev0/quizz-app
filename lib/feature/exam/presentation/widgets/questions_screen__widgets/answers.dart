import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/choice_item_card.dart';

class Answers extends StatelessWidget {
   final List<ExamQuestionsEntity> questions;
   const Answers({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuestionsScreenViewModel>();
    int currentQuestion = viewModel.getCurrentQuestion();
    return SizedBox(
      height: 204,
      child: ListView.builder(
         itemCount: questions[currentQuestion].answers!.length,
          itemBuilder: (context,index){
            return ChoiceItemCard(answer: questions[currentQuestion].answers![index],);
          }
      ),
    );
  }
}
