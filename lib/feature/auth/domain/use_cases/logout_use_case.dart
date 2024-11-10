
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

@injectable
class LogoutUseCase{
  AuthRepository authRepository;
  LogoutUseCase(this.authRepository);
  Future<Result<String>> logout(String token) async{
    return await authRepository.logout(token);
  }

}