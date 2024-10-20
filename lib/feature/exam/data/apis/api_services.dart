import 'package:dio/dio.dart';
import 'package:quizz_app/feature/exam/data/models/Subject_response.dart';
import 'package:retrofit/retrofit.dart';

import 'apis_const.dart';

part 'api_services.g.dart';
@RestApi(baseUrl: ApiConst.baseUrl)
abstract class ApiServices{

  factory ApiServices(Dio dio) = _ApiServices;

  @GET("/${ApiConst.subjecstId}")
  Future<SubjectResponse> getSubjects();
}