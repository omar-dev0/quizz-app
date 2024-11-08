
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/exam_by_id_repo.dart';

import '../apis/DTO/dto.dart';

@Injectable(as: ExamByIdRepo)
class ExamByIdRepoImpl implements ExamByIdRepo{
  OnlineDataSource _onlineDataSource;
  OfflineDataSource _offlineDataSource;
  @factory
  ExamByIdRepoImpl(this._onlineDataSource, this._offlineDataSource);
  @override
  Future<Either<String, List<CachedExamResultEntity>>> getExamById() async {
    try{
      final exam = await _offlineDataSource.getExamById();
      return Right(exam!);
    }on Exception catch(e){
      return const Left("Error");
    }

  }
}