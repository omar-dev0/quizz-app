import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';
import '../model/user.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);
  Future<Result<User?>>invoke(String email,String password){
    return authRepository.login(email, password);
  }
}