import 'package:dartz/dartz.dart';

import '../core/server_failure.dart';
import '../entities/exam_question_entity.dart';

abstract class ExamQuestionsRepo{
  Future<Either<ServerFailure,List<ExamQuestionsEntity>>> getQuestions(String examId);
}