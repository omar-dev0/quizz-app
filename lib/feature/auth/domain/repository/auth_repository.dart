import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';

import '../../data/api/model/response/login/Otp_code_response.dart';
import '../common/api_result.dart';
import '../model/user.dart' as domain;

abstract class AuthRepository{
  Future<Result<domain.User?>> login(String email,String password);
  Future<Result<void>> signUp(domain.User appUser, String password, String confirmPassword);
    Future<Result<OtpCodeResponse?>> getOtpCode(String email);
}