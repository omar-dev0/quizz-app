import 'package:quizz_app/feature/exam/data/apis/api_services.dart';
import 'package:quizz_app/feature/exam/data/models/Subject_response.dart';

abstract class OnlineDataSource{

  Future<List<SubjectResponse>> getSubjects();
}