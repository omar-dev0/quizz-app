import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/questions_cached_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/domain/entities/answers_cached_entity.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource {
  @override
  Future<List<SubjectCachedModel>> getSubjects() async {
    var box = Hive.box<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
    return box.values.toList();
  }

  @override
  Future<List<SubjectExamsCachedModel>> getSubjectExams(
      String subjectId) async {
    var box =
        Hive.box<SubjectExamsCachedModel>(AppConstant.kSubjectExamsHiveBox);
    List<SubjectExamsCachedModel> list =
        _getCachedSubjectExamsBySubjectId(box, subjectId);
    return list;
  }

  List<SubjectExamsCachedModel> _getCachedSubjectExamsBySubjectId(
      Box<SubjectExamsCachedModel> box, String subjectId) {
    var allCachedList = box.values.toList();
    List<SubjectExamsCachedModel> list = [];
    for (var exam in allCachedList) {
      if (exam.subjectId == subjectId) {
        list.add(exam);
      }
    }
    return list;
  }

  @override
  Future<List<QuestionsCachedModel>> getQuestionsOnExamId(String examId) async {
    var box = Hive.box<QuestionsCachedModel>(AppConstant.kQuestionsHiveBox);
    List<QuestionsCachedModel> questions = [];
    var allCached = box.values.toList();
    for (var question in allCached) {
      if(examId == question.exam?.examId){
        questions.add(question);
      }
    }
    return questions;
  }

  @override
  Future<List<SubjectExamsCachedModel>>? getExamById() async{
    var box = Hive.box<SubjectExamsCachedModel>(AppConstant.kSubjectExamsHiveBox);
    var box2 = Hive.box<AnswerCachedEntity>(AppConstant.kAnswersResultHiveBox);
    List<SubjectExamsCachedModel> list1 = box.values.toList();
    List<AnswerCachedEntity> list2 = box2.values.toList();
    List<SubjectExamsCachedModel> ret = [];
    for(var item in list1){
      for(var item2 in list2){
        if(item.examId == item2.examId){
          ret.add(item);
        }
      }
    }
    return ret;
  }
}
