import 'package:dartz/dartz.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';

import '../entities/cached_exam_result_entity.dart';

abstract class ExamByIdRepo{
  Future<Either<String,List<CachedExamResultEntity>>> getExamById();
}