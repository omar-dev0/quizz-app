import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/models/exams_response.dart';
import 'package:quizz_app/feature/exam/data/models/subject_response.dart';
import 'package:retrofit/retrofit.dart';

import 'apis_const.dart';

part 'api_services.g.dart';
@lazySingleton
@RestApi(baseUrl: ApiConst.baseUrl)
abstract class ApiServices{

  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @GET("/${ApiConst.subjecstId}")
  Future<SubjectResponse> getSubjects(@Header("token") String token);

  @GET("/${ApiConst.exam}/{id}")
  Future<ExamsResponse> getExamsBySubjectId(@Header("token") String token, @Path("id") String id);

}