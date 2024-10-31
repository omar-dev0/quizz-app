import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamStartScreen extends StatelessWidget {
  final String examId;
  const ExamStartScreen({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Exam details"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new) )
      ),
      body: const Center(child: Text("data"),),
    );
  }
}
