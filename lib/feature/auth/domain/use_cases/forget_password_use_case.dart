import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

@injectable
class ForgetPasswordUseCase{
  AuthRepository authRepository;
  ForgetPasswordUseCase(this.authRepository);
  void invoke(){
    authRepository.resetPassword();
  }
}