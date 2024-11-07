import 'package:quizz_app/feature/exam/data/models/subject_response.dart';

abstract class OnlineDataSource{

  Future<SubjectResponse> getSubjects();
}