
import 'package:hive/hive.dart';
part 'subject_cached_model.g.dart';
@HiveType(typeId: 1)
class SubjectCachedModel{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? icon;

  SubjectCachedModel(this.id, this.name, this.icon);
}