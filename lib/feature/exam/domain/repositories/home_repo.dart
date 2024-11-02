import 'package:dartz/dartz.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';

abstract class HomeRepo{
  Future<Either<ServerFailure,List<SubjectItemEntity>>> getSubject();


}