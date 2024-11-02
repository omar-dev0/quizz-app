import 'package:quizz_app/feature/exam/data/models/subject_models/subject_response.dart';

import '../../models/exam_by_subject_id_models/exams_by_subject_response.dart';

abstract class OnlineDataSource{

  Future<SubjectResponse> getSubjects();
  Future<ExamsBySubjectResponse> getExamById(String id);
}