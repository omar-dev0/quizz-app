
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Fail, List<SubjectItemEntity>>> getSubject() {
    // TODO: implement getSubject
    throw UnimplementedError();
  }

}