import 'package:json_annotation/json_annotation.dart';

import 'Subjects.dart';

part 'Subject_response.g.dart';
@JsonSerializable()
class SubjectResponse {
  SubjectResponse({
      this.subjects,});

  SubjectResponse.fromJson(dynamic json) {
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subjects.fromJson(v));
      });
    }
  }
  List<Subjects>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}