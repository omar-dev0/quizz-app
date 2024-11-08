import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';

import 'answer_entity.dart';

class ExamQuestionsEntity {
  List<AnswersEntity>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  ExamEntity? exam;

  ExamQuestionsEntity(
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.exam,
  );
}
