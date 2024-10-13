import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

abstract class AuthRepository{
  Future<LoginResponse?> login(String email,String password);
  Future<OtpCodeResponse?> getOtpCode(String email);
}