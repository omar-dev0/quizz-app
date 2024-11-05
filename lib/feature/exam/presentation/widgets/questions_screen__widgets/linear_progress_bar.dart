import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/colors.dart';

class LinearProgressBar extends StatefulWidget {
  const LinearProgressBar({super.key});

  @override
  State<LinearProgressBar> createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> {
  double _progress = 1.0;
  double _currentQuestions = 1;
  double _totalQuestionsNumber = 20;
  void _increment(){
    setState(() {
      _progress = _currentQuestions/ _totalQuestionsNumber;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _increment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgressIndicator(
          value: _progress,
          minHeight: 4,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      ],
    );
  }
}

