
import 'package:dio/dio.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: "https://exam.elevateegy.com//api/v1/auth/")
abstract class ApiServices{
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST('signin')
  Future<LoginResponse> login(String email,String password);
}