import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/subject_cached_model.dart';

abstract class OfflineDataSource{
  Future<List<SubjectCachedModel>> getSubjects();
}