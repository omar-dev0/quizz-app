import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/questions_screen__widgets/timer_end_dialog.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors.dart';

class QuesionsScreenAppBar extends StatefulWidget {
  final QuestionsScreenViewModel viewModel;
  final List<ExamQuestionsEntity> list;
  final int examDuration;
  const QuesionsScreenAppBar({super.key, required this.viewModel,required this.list, required this.examDuration});

  @override
  State<QuesionsScreenAppBar> createState() => _QuesionsScreenAppBarState();
}

class _QuesionsScreenAppBarState extends State<QuesionsScreenAppBar> {
  Timer? _timer;
  int _minutes = 0;
  int _seconds = 0;
  Color _timerColor = AppColors.timerColor;
  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      setState(() {
        _timerColor = AppColors.error;
        if (_seconds == 0 && _minutes == 0) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return  TimerEndDialog(onPressed: () {
                widget.viewModel.doAction(SubmitExamAction(widget.list));
                Navigator.pop(context);
              },);
            },
          );
          timer.cancel();
        } else if (_seconds == 0) {
          _minutes--;
          _seconds = 59;
        } else {
          _seconds--;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _minutes = widget.examDuration;
    _timerColor = AppColors.timerColor;
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              "Exam",
              style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,
            )
          ],
        ),
        BlocBuilder<QuestionsScreenViewModel, QuestionsScreenStates>(
          builder: (context, state) {
            if (state is FinishedExamState) {
              _timer?.cancel();
              return const SizedBox();
            }
            return Row(
              children: <Widget>[
                Image.asset(ImageAssets.timerImage),
                const SizedBox(
                  width: 6,
                ),
                Text("$_minutes:${_seconds.toString().padLeft(2, '0')}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(
                      color: _timerColor,
                    )),
              ],
            );
          },
        )
      ],
    );
  }
}


