import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

@injectable
class ForgetPasswordUseCase{
  AuthRepository authRepository;
  ForgetPasswordUseCase(this.authRepository);
  Future<Result<OtpCodeResponse?>> invoke(String email)async{
    return await authRepository.getOtpCode(email);
  }
}