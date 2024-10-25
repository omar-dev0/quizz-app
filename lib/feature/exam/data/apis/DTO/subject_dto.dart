import 'package:quizz_app/feature/exam/data/models/subject_response.dart';

import '../../../domain/entities/subject_item_entity.dart';

abstract class SubjectDIO{
  static List<SubjectItemEntity> subjectResponseDTO(SubjectResponse response) {
    List<SubjectItemEntity> subjects = [];
    for(var subject in response.subjects!){
      SubjectItemEntity subjectItemEntity  = SubjectItemEntity(subject.Id, subject.name, subject.icon);
      subjects.add(subjectItemEntity);
    }
    return subjects;
  }
}