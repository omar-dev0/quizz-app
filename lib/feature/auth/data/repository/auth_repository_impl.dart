import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/data/data_source/contracts/auth_data_source.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

import '../../domain/common/api_result.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{

  AuthOnlineDataSource authOnlineDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.authOnlineDataSource);
  @override
  Future<Result<LoginResponse?>> login(String email, String password) async{
    return await authOnlineDataSource.login(email, password);
  }



  @override
  Future<Result<OtpCodeResponse?>> getOtpCode(String email) async {
    return await authOnlineDataSource.getOtpCode(email);
  }
}
