import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/data/data_source/contracts/auth_data_source.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

import '../../domain/common/api_result.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthOnlineDataSource authOnlineDataSource;
  AuthOfflineDataSource authOfflineDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.authOnlineDataSource, this.authOfflineDataSource);

  @override
  Future<Result<LoginResponse?>> login(String email, String password) async {
    var user;
    try {
      user = authOfflineDataSource.login();
      if (user.isNotEmpty) {
        return Success(user.first);
      }
      user = await authOnlineDataSource.login(email, password);
      return Success(user);
    } on Exception catch (e) {
      return Fail(e.toString());
    }
  }

  @override
  Future<Result<OtpCodeResponse?>> getOtpCode(String email) async {
    return await authOnlineDataSource.getOtpCode(email);
  }
}
