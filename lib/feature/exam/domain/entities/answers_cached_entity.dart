
import 'package:hive/hive.dart';
part 'answers_cached_entity.g.dart';
@HiveType(typeId: 5)
class AnswerCachedEntity {
  @HiveField(0)
  String? correctKey;
  @HiveField(1)
  String? userChoiceKey;
  @HiveField(2)
  String? examId;

  AnswerCachedEntity(this.correctKey, this.userChoiceKey, this.examId);
}
