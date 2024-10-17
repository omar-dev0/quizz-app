import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

import '../../../domain/common/api_result.dart';
import '../../../domain/model/user.dart';

abstract class AuthOnlineDataSource{
  Future<Result<LoginResponse?>> login(String email,String password);
  Future<Result<OtpCodeResponse?>> getOtpCode(String email);
}

abstract class AuthOfflineDataSource{
    Result<LoginResponse> login();
}