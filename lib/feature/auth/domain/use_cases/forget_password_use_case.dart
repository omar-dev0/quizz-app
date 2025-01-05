import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/model/Otp_respones_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/verify_otp_entity.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

import '../../data/api/model/response/login/Otp_code_response.dart';
import '../model/reset_password_entity.dart';

@injectable
class ForgetPasswordUseCase{
  AuthRepository authRepository;
  ForgetPasswordUseCase(this.authRepository);
  Future<Result<OtpResponesEntity>> invoke(String email)async{
    return await authRepository.getOtpCode(email);
  }

  Future<Result<VerifyOtpCodeEntity>> verifyOtp(String otpCode)async {
    return await authRepository.verifyOtp(otpCode);
  }

  Future<Result<ResetPasswordEntity>> resetPassword(String email, String newPassword)async{
    return await authRepository.resetPassword(email, newPassword);
  }
}