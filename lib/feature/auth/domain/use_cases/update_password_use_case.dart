import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/domain/model/update_password_entity.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

import '../common/api_result.dart';

@injectable
class UpdatePasswordUseCase{
  final AuthRepository _authRepository;
  UpdatePasswordUseCase(this._authRepository);


  Future<Result<UpdatePasswordEntity>> updatePassword(String oldPassword,String newPassword,String rePassword) async {
    return await _authRepository.updatePassword(
        oldPassword, newPassword, rePassword);
  }
}