import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domain;

import '../../../domain/common/api_result.dart';
import '../../api/model/response/login/Otp_code_response.dart';

abstract class AuthOnlineDataSource{
  Future<Result<LoginResponse?>> login(String email,String password);
  Future<Result<OtpCodeResponse?>> getOtpCode(String email);
  Future<Result<void>> signUp(domain.User appUser, String password , String confirmPassword);
}

abstract class AuthOfflineDataSource{
  List<LoginResponse> login();
}