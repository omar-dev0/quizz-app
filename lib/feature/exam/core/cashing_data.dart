import 'package:hive/hive.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';

import '../../../../core/resources/app_constant.dart';
import '../data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import '../data/models/exams_by_subject_response.dart';
import '../domain/entities/subject_item_entity.dart';


abstract class CachingData{

  static void cachedSubject(List<SubjectItemEntity> subjects) {
    var box = Hive.box<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
    box.addAll(_covertToSubjectCachedModel(subjects));
  }

  static List<SubjectCachedModel> _covertToSubjectCachedModel(List<SubjectItemEntity> list){
    List<SubjectCachedModel> subjects = [];
    for(var subject in list){
      subjects.add(
          SubjectCachedModel(subject.id, subject.name, subject.icon)
      );
    }
    return subjects;
  }


  static void cachedSubjectExams(ExamsBySubjectResponse response){
    var box = Hive.box<SubjectExamsCachedModel>(AppConstant.kSubjectExamsHiveBox);
    box.addAll(_convertToSubjectExamsCachedModel(response));
  }

  static List<SubjectExamsCachedModel> _convertToSubjectExamsCachedModel(ExamsBySubjectResponse response){
    List<SubjectExamsCachedModel> list = [];
    for(var exam in response.exams!){
      list.add(
          SubjectExamsCachedModel(exam.Id, exam.title, exam.duration, exam.subject, exam.numberOfQuestions)
      );
    }
    return list;
  }
}
