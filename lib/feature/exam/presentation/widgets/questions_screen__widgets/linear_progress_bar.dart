import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';

import '../../../../../core/resources/colors.dart';

class LinearProgressBar extends StatefulWidget {
  const LinearProgressBar({super.key});

  @override
  State<LinearProgressBar> createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> {
  double _progress = 1.0;
  double _currentQuestions = 1;
  double _totalQuestionsNumber = 10;
  void _increment(){
    setState(() {
      _progress = _currentQuestions/ _totalQuestionsNumber;
    });
  }
  @override
  void initState() {
    _increment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionsScreenViewModel,QuestionsScreenStates>(
      listener: (context,state){
        if(state is GoToNextQuestionState || state is LastQuestionState){
           _currentQuestions++;
        }else if(state is GoToPreviousQuestionState){
          _currentQuestions--;
        }
        _increment();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            value: _progress,
            minHeight: 4,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ],
      ),
    );
  }
}

