import 'package:quizz_app/feature/auth/data/api/model/request/Otp_code_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

abstract class AuthOnlineDataSource{
  Future<LoginResponse?> login(String email,String password);
  Future<OtpCodeResponse?> getOtpCode(String email);
}