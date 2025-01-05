import 'package:quizz_app/feature/auth/data/api/model/request/reset_password_request_model.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/reset_password_response_model.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/verify_otp_response_model.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domain;

import '../../../domain/common/api_result.dart';
import '../../api/model/response/login/Otp_code_response.dart';

abstract class AuthOnlineDataSource{
  Future<LoginResponse> login(String email,String password);
  Future<OtpCodeResponse> getOtpCode(String email);
  Future<Result<void>> signUp(domain.User appUser, String password , String confirmPassword);
  Future<String> logout(String token);
  Future<VerifyOtpResponseModel> verifyOtp(String otpCode);
  Future<ResetPasswordResponseModel> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel);
}

abstract class AuthOfflineDataSource{
   Future<void> saveToken(String token);
   Future<void> deleteToken();
   Future<String> getToken();
}