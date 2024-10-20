import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/data/models/Subjects.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  OnlineDataSource _onlineDataSource;

  @factory
  HomeRepoImpl(this._onlineDataSource);

  @override
  Future<Either<ServerFailure, List<SubjectItemEntity>>> getSubject() async{
    try{
      final response = await _onlineDataSource.getSubjects();
      List<SubjectItemEntity> subjects = subjectResponseDTO(response);
      return Right(subjects);
    }on Exception catch(e){
      if(e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
    }
    return Left(ServerFailure("unknown"));
  }

  List<SubjectItemEntity> subjectResponseDTO(List<Subjects> response) {
    List<SubjectItemEntity> subjects = [];
    for(var subject in response){
      SubjectItemEntity subjectItemEntity  = SubjectItemEntity(subject.id, subject.name, subject.icon);
      subjects.add(subjectItemEntity);
    }
    return subjects;
  }

}
