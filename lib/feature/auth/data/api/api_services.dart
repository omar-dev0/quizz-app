import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/data/core/end_points.dart';
import 'package:retrofit/retrofit.dart';
import '../core/base_url.dart';
import 'model/request/login_request.dart';

part 'api_services.g.dart';
@lazySingleton
@RestApi(baseUrl: BaseUrl.authBaseUrl)
abstract class ApiServices{
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(EndPoints.loginEndPoint)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}