import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/exams_quesions_repo.dart';

@Injectable(as: ExamQuestionsRepo)
class ExamQuestionsRepoImpl implements ExamQuestionsRepo{
  OnlineDataSource _onlineDataSource;
  OfflineDataSource _offlineDataSource;

  @factory
  ExamQuestionsRepoImpl(this._onlineDataSource, this._offlineDataSource);
  @override
  Future<Either<ServerFailure, List<ExamQuestionsEntity>>> getQuestions(String examId) {
    // TODO: implement getQuestions
    throw UnimplementedError();
  }

}