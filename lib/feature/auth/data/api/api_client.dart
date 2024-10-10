import 'package:dio/dio.dart';
import 'package:quizz_app/feature/auth/data/api/api_services.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/login_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

class ApiClient{
  final Dio _dio = Dio();
  late ApiServices _apiServices;

  ApiClient(){
    _dio.options = BaseOptions(
      contentType:"application/json",
    );
    _apiServices = ApiServices(_dio);
  }
  Future<LoginResponse?> login(String email, String password)async {
    try{
      final loginRequest = LoginRequest(email: email, password: password);
      final response = await _apiServices.login(loginRequest);
      return response;
    }catch(e){
      print(e);
      return null;
    }
  }
}