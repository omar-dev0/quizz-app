
import 'package:hive/hive.dart';
part 'exam_entity.g.dart';
@HiveType(typeId: 6)
class ExamEntity{
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

  ExamEntity(this.examId, this.title, this.duration, this.subjectId, this.numberOfQuestions);
}