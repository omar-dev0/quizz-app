import 'package:dartz/dartz.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';

abstract class HomeRepo{
  Future<Either<Fail,List<SubjectItemEntity>>> getSubject();
}