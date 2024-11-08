import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/questions_cached_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';

abstract class OfflineDataSource{
  Future<List<SubjectCachedModel>> getSubjects();
  Future<List<SubjectExamsCachedModel>> getSubjectExams(String subjectId);
  Future<List<QuestionsCachedModel>> getQuestionsOnExamId(String examId);
  Future<SubjectExamsCachedModel>? getExamById(String examId);
}