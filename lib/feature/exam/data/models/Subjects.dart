import 'package:json_annotation/json_annotation.dart';

part "Subjects.g.dart";

@JsonSerializable()
class Subjects {
  Subjects({
      this.id, 
      this.name, 
      this.icon, 
      this.createdAt,});

  Subjects.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? name;
  String? icon;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }

}