import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/exams_quesions_repo.dart';

import '../apis/DTO/subject_dto.dart';

@Injectable(as: ExamQuestionsRepo)
class ExamQuestionsRepoImpl implements ExamQuestionsRepo{
  OnlineDataSource _onlineDataSource;
  OfflineDataSource _offlineDataSource;

  @factory
  ExamQuestionsRepoImpl(this._onlineDataSource, this._offlineDataSource);
  @override
  Future<Either<ServerFailure, List<ExamQuestionsEntity>>> getQuestions(String examId) async{
    try{
      final response = await _onlineDataSource.getExamQuestionsByExamId(examId);
      List<ExamQuestionsEntity> examInformation = DTOs.examQuestionsByExamIdDto(response);
      return Right(examInformation);
    }on Exception catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("unknown"));
    }
  }

}