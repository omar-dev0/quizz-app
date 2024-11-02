import 'package:hive/hive.dart';

import '../subject_exams_model/subject_exams_model.dart';

part 'questions_model.g.dart';

@HiveType(typeId: 2)
class QuestionsModel {
  @HiveField(0)
  List<AnswersCached>? answers;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? id;
  @HiveField(3)
  String? question;
  @HiveField(4)
  String? correct;
  @HiveField(5)
  SubjectExamsCachedModel? exam;

  QuestionsModel(
      this.answers, this.type, this.id, this.question, this.correct, this.exam);
}

class AnswersCached {
  String? answer;
  String? key;

  AnswersCached(
    this.answer,
    this.key,
  );
}
