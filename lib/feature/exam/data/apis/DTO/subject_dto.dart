import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/data/models/subject_response.dart';
import '../../../domain/entities/exam_entity.dart';
import '../../../domain/entities/subject_item_entity.dart';
import '../../models/exams_by_subject_response.dart';

abstract class SubjectDIO{

  static List<SubjectItemEntity> subjectResponseDTO(SubjectResponse response) {
    List<SubjectItemEntity> subjects = [];
    for(var subject in response.subjects!){
      SubjectItemEntity subjectItemEntity  = SubjectItemEntity(subject.Id, subject.name, subject.icon);
      subjects.add(subjectItemEntity);
    }
    return subjects;
  }

  static List<SubjectItemEntity> subjectCachedDTO(List<SubjectCachedModel> list){
    List<SubjectItemEntity> subjects = [];
    for(var subject in list){
      subjects.add(
        SubjectItemEntity(subject.id, subject.name, subject.icon)
      );
    }
    return subjects;
  }


  static List<ExamEntity> examsResponseByIdDto(ExamsBySubjectResponse examResponse){
    List<ExamEntity> examList = [];
    for(var exam in examResponse.exams!){
      examList.add(
        ExamEntity(exam.Id, exam.title, exam.duration, exam.subject, exam.numberOfQuestions)
      );
    }
    return examList;
  }

}