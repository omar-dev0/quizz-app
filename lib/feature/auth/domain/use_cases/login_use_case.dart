import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/model/login_response_entity.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';
import '../model/user.dart' as domain;
@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);
  Future<Result<LoginResponseEntity>> invoke(String email,String password) async{
    return await authRepository.login(email, password);
  }
}
