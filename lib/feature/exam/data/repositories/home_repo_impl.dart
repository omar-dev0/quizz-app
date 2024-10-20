import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  OnlineDataSource _onlineDataSource;

  @factory
  HomeRepoImpl(this._onlineDataSource);

  @override
  Future<Either<Fail, List<SubjectItemEntity>>> getSubject() {
    // TODO: implement getSubject
    throw UnimplementedError();
  }

}
