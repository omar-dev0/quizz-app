import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

import '../common/api_result.dart';

abstract class AuthRepository{
  Future<Result<LoginResponse?>> login(String email,String password);
  Future<OtpCodeResponse?> getOtpCode(String email);
}