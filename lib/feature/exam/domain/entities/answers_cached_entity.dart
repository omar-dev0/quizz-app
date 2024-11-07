
import 'package:hive/hive.dart';
part 'answers_cached_entity.g.dart';
@HiveType(typeId: 5)
class AnswerCachedEntity {
  @HiveField(0)
  String? answer;
  @HiveField(1)
  String? correctKey;
  @HiveField(2)
  String? userChoiceKey;

  AnswerCachedEntity(this.answer, this.correctKey, this.userChoiceKey);
}
