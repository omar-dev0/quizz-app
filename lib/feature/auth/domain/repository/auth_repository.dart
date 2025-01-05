import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/domain/model/Otp_respones_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/reset_password_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/verify_otp_entity.dart';

import '../../data/api/model/response/login/Otp_code_response.dart';
import '../common/api_result.dart';
import '../model/user.dart' as domain;

abstract class AuthRepository{
  Future<Result<domain.User?>> login(String email,String password);
  Future<Result<void>> signUp(domain.User appUser, String password, String confirmPassword);
  Future<Result<OtpResponesEntity>> getOtpCode(String email);
  Future<Result<String>> logout(String token);
  Future<Result<VerifyOtpCodeEntity>> verifyOtp(String otpCode);
  Future<Result<ResetPasswordEntity>> resetPassword(String email, String newPassword);
}