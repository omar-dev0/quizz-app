
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/exam/domain/entities/logout_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/logout_repo.dart';

@injectable
class LogoutUseCase{
  final LogoutRepo _logoutRepo;

  LogoutUseCase(this._logoutRepo);

  Future<Result<LogoutEntity>> logout() async{
    return await _logoutRepo.logout();
  }
}