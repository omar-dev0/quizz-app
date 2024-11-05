import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/colors.dart';

class ChoiceItemCard extends StatefulWidget {
  const ChoiceItemCard({super.key});

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
          const Text("Answer here")
        ],
      ),
    );
  }
}

