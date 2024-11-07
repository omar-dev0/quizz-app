
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/exam_by_id_repo.dart';

@Injectable(as: ExamByIdRepo)
class ExamByIdRepoImpl implements ExamByIdRepo{
  OnlineDataSource _onlineDataSource;


  @factory
  ExamByIdRepoImpl(this._onlineDataSource);
  @override
  Future<Either<ServerFailure, ExamEntity>> getExamById(String id) {
    // TODO: implement getExamById
    throw UnimplementedError();
  }

}