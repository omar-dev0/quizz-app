import 'package:hive/hive.dart';
import 'package:quizz_app/feature/exam/domain/entities/answers_cached_entity.dart';
import 'exam_entity.dart';

part 'cached_exam_result_entity.g.dart';

@HiveType(typeId: 4)
class CachedExamResultEntity {
  @HiveField(0)
  List<AnswerCachedEntity>? answers;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? id;
  @HiveField(3)
  String? question;
  @HiveField(4)
  String? correct;
  @HiveField(5)
  ExamEntity? exam;

  CachedExamResultEntity(this.answers, this.type, this.id, this.question,
      this.correct, this.exam,);
}
