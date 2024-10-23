import 'package:quizz_app/feature/exam/data/models/Subjects.dart';

abstract class OnlineDataSource{

  Future<List<Subjects>> getSubjects();
}