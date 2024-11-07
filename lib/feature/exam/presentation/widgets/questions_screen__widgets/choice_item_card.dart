import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';

class ChoiceItemCard extends StatefulWidget {
  final AnswersEntity answer;
  const ChoiceItemCard({super.key, required this.answer});

  @override
  State<ChoiceItemCard> createState() => _ChoiceItemCardState();
}

class _ChoiceItemCardState extends State<ChoiceItemCard> {
  bool _isChecked = false;
  String _selectedOptions = "";
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(17.5),
      height: 52,
      width: context.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            spreadRadius: 0,
            blurRadius:1
          )
        ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightBlue),
      child: Row(
        children: [
           Checkbox(value: _isChecked,
               onChanged: (value){
             _isChecked = value!;
             setState(() {
             });
           }),
           // ignore: prefer_const_constructors
           SizedBox(width: 8,),
           Text(widget.answer.answer??"")
        ],
      ),
    );
  }
}

