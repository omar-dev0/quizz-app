
import 'package:hive/hive.dart';
part 'answers_cached.g.dart';
@HiveType(typeId: 3)
class AnswersCached {
  @HiveField(0)
  String? answer;
  @HiveField(1)
  String? key;

  AnswersCached(this.answer,
      this.key,);
}