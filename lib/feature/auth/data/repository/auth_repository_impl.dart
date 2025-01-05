import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/feature/auth/data/api/excute_api_call.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/reset_password_request_model.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/data/data_source/cached_token.dart';
import 'package:quizz_app/feature/auth/data/data_source/contracts/auth_data_source.dart';
import 'package:quizz_app/feature/auth/domain/model/Otp_respones_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/reset_password_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domaine;
import 'package:quizz_app/feature/auth/domain/model/verify_otp_entity.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';

import '../../domain/common/api_result.dart';
import '../api/DTO.dart';
import '../api/model/response/login/Otp_code_response.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthOnlineDataSource authOnlineDataSource;
  AuthOfflineDataSource authOfflineDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.authOnlineDataSource, this.authOfflineDataSource);

  @override
  Future<Result<domaine.User?>> login(String email, String password) async {
    try {
      var user = await authOnlineDataSource.login(email, password);
      var loginUser;
      if(user is Success<LoginResponse?>){
        var box = Hive.box<CachedToken>(AppConstant.ktoken);
          box.add(CachedToken(user.data!.token));
         loginUser = user.data;
      }
      loginUser.toString();

      return Success(DTO.userDto(loginUser));
    } on Exception catch (e) {
      if(e is DioException) {
        return ServerFailure.fromDioError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  @override
  Future<Result<OtpResponesEntity>> getOtpCode(String email) async {
    return await executeApiCall<OtpResponesEntity>(()async{
       var response = await authOnlineDataSource.getOtpCode(email);
       return response.toDomain();
    });
  }

  @override
  Future<Result<void>> signUp(domaine.User appUser, String password, String confirmPassword) {
    return authOnlineDataSource.signUp(appUser, password, confirmPassword);
  }

  @override
  Future<Result<String>> logout(String token)async {
    try{
      var response = await authOnlineDataSource.logout(token);
      return Success(response);
    }on Exception catch(e){
      if(e is DioException){
        return ServerFailure.fromDioError(e);
      }
      return ServerFailure("unkown");
    }
  }

  @override
  Future<Result<VerifyOtpCodeEntity>> verifyOtp(String otpCode) async {
    return executeApiCall<VerifyOtpCodeEntity>(() async{
       var response = await authOnlineDataSource.verifyOtp(otpCode);
       return response.toDomain();
    });
  }

  @override
  Future<Result<ResetPasswordEntity>> resetPassword(String email, String newPassword) async{
    return executeApiCall<ResetPasswordEntity>(()async{
      var response = await authOnlineDataSource.resetPassword(ResetPasswordRequestModel(email: email,newPassword: newPassword));
      return response.toDomain();
    });
  }
}
