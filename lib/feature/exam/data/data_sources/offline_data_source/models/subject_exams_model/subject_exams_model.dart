
import 'package:hive/hive.dart';

part 'subject_exams_model.g.dart';
@HiveType(typeId: 1)
class SubjectExamsModel{
  @HiveField(0)
  String? examId;
  @HiveField(1)
  String? title;
  @HiveField(2)
  int? duration;
  @HiveField(3)
  String? subjectId;
  @HiveField(4)
  int? numberOfQuestions;

  SubjectExamsModel(this.examId, this.title, this.duration, this.subjectId, this.numberOfQuestions);
}