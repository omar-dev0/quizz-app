
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/apis/DTO/subject_dto.dart';
import 'package:quizz_app/feature/exam/data/core/caching_data.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  OnlineDataSource _onlineDataSource;
  OfflineDataSource _offlineDataSource;
  @factory
  HomeRepoImpl(this._onlineDataSource, this._offlineDataSource);

  @override
  Future<Either<ServerFailure, List<SubjectItemEntity>>> getSubject() async{
    try{
      List<SubjectCachedModel> subject = await _offlineDataSource.getSubjects();
      if(subject.isNotEmpty){
         return Right(DTOs.subjectCachedDTO(subject));
      }

      final response = await _onlineDataSource.getSubjects();
      List<SubjectItemEntity> subjects = DTOs.subjectResponseDTO(response);
      CachingData.cachedSubject(subjects);

      return Right(subjects);
    }on Exception catch(e){
      if(e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
    }
    return Left(ServerFailure("unknown"));
  }

  @override
  Future<Either<ServerFailure, List<ExamEntity>>> getExam(String subjectId)async {
    try{
      final List<SubjectExamsCachedModel> cachedExams = await _offlineDataSource.getSubjectExams(subjectId);
      if(cachedExams.isNotEmpty){
        return Right(DTOs.examsCachedByIdDto(cachedExams));
      }
      final response = await _onlineDataSource.getExamById(subjectId);
      CachingData.cachedSubjectExams(response);
      List<ExamEntity> examsList = DTOs.examsResponseByIdDto(response);
      return Right(examsList);
    }on Exception catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure("unknown"));
    }
  }
}
