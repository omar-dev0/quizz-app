import 'package:hive/hive.dart';

import '../subject_exams_model/subject_exams_model.dart';
import 'answers_cached.dart';

part 'questions_cached_model.g.dart';

@HiveType(typeId: 2)
class QuestionsCachedModel {
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

  QuestionsCachedModel(
      this.answers, this.type, this.id, this.question, this.correct, this.exam);
}

