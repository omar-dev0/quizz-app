import 'package:hive/hive.dart';
part 'subject_item_entity.g.dart';
@HiveType(typeId: 0)
class SubjectItemEntity{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? icon;

  SubjectItemEntity(this.id, this.name, this.icon);
}