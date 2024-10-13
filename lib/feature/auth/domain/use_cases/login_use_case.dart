import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);
  Future<LoginResponse?>invoke(String email,String password) async{
    return await authRepository.login(email, password);
  }
}