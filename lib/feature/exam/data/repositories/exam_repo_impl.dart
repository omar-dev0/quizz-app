import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/exam_repo.dart';
import '../apis/DTO/subject_dto.dart';
import '../core/caching_data.dart';
import '../data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import '../data_sources/offline_data_source/offline_data_source.dart';
import '../data_sources/online_data_source/online_data_source.dart';


@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  OnlineDataSource _onlineDataSource;
  OfflineDataSource _offlineDataSource;

  @factory
  ExamRepoImpl(this._onlineDataSource, this._offlineDataSource);


  @override
  Future<Either<ServerFailure, List<ExamEntity>>> getExam(String subjectId) async{
    try {
      final List<SubjectExamsCachedModel> cachedExams = await _offlineDataSource
          .getSubjectExams(subjectId);
      if (cachedExams.isNotEmpty) {
        return Right(DTOs.examsCachedByIdDto(cachedExams));
      }
      final response = await _onlineDataSource.getExamById(subjectId);
      CachingData.cachedSubjectExams(response);
      List<ExamEntity> examsList = DTOs.examsResponseByIdDto(response);
      return Right(examsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("unknown"));
    }
  }
}