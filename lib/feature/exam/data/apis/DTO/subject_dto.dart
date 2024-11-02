import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/data/models/subject_models/subject_response.dart';
import '../../../domain/entities/exam_entity.dart';
import '../../../domain/entities/subject_item_entity.dart';
import '../../models/exam_by_subject_id_models/exams_by_subject_response.dart';

abstract class DTOs{

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
    List<ExamEntity> exameList = [];
    for(var exam in examResponse.exams!){
      exameList.add(
        ExamEntity(exam.Id, exam.title, exam.duration, exam.subject, exam.numberOfQuestions)
      );
    }
    return exameList;
  }

  static List<ExamEntity> examsCachedByIdDto(List<SubjectExamsCachedModel> cachedExams){
    List<ExamEntity> exameList = [];
    for(var exam in cachedExams){
      exameList.add(
          ExamEntity(exam.examId, exam.title, exam.duration, exam.subjectId, exam.numberOfQuestions)
      );
    }
    return exameList;
  }



}