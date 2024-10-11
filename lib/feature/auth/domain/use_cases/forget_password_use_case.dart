import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

@injectable
class ForgetPasswordUserCase{
  AuthRepository authRepository;
  ForgetPasswordUserCase(this.authRepository);
  void invoke(){
    authRepository.resetPassword();
  }
}