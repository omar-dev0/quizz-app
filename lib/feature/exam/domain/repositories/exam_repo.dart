import 'package:dartz/dartz.dart';

import '../core/server_failure.dart';
import '../entities/exam_entity.dart';

abstract class ExamRepo{
  Future<Either<ServerFailure,List<ExamEntity>>> getExam(String subjectId);
}