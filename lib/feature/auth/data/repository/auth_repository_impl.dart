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
import 'package:quizz_app/feature/auth/domain/model/login_response_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/reset_password_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/update_password_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domaine;
import 'package:quizz_app/feature/auth/domain/model/verify_otp_entity.dart';
import 'package:quizz_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';

import '../../domain/common/api_result.dart';
import '../api/DTO.dart';
import '../api/model/request/update_password_request_model.dart';
import '../api/model/response/login/Otp_code_response.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthOnlineDataSource authOnlineDataSource;
  AuthOfflineDataSource authOfflineDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.authOnlineDataSource, this.authOfflineDataSource);

  @override
  Future<Result<LoginResponseEntity>> login(
      String email, String password) async {
    return executeApiCall<LoginResponseEntity>(() async {
      var response = await authOnlineDataSource.login(email, password);
      await authOfflineDataSource.saveToken(response.token!);
      return response.toDomain();
    });
  }

  @override
  Future<Result<OtpResponesEntity>> getOtpCode(String email) async {
    return await executeApiCall<OtpResponesEntity>(() async {
      var response = await authOnlineDataSource.getOtpCode(email);
      return response.toDomain();
    });
  }

  @override
  Future<Result<void>> signUp(
      domaine.User appUser, String password, String confirmPassword) {
    return authOnlineDataSource.signUp(appUser, password, confirmPassword);
  }

  @override
  Future<Result<String>> logout() async {
    String token = await authOfflineDataSource.getToken();
    return await executeApiCall<String>(()async{
      var response = await authOnlineDataSource.logout(token);
      var box = Hive.box<CachedExamResultEntity>(AppConstant.kExamResult);
      box.clear();
      return response;
    });
  }

  @override
  Future<Result<VerifyOtpCodeEntity>> verifyOtp(String otpCode) async {
    return executeApiCall<VerifyOtpCodeEntity>(() async {
      var response = await authOnlineDataSource.verifyOtp(otpCode);
      return response.toDomain();
    });
  }

  @override
  Future<Result<ResetPasswordEntity>> resetPassword(
      String email, String newPassword) async {
    return executeApiCall<ResetPasswordEntity>(() async {
      var response = await authOnlineDataSource.resetPassword(
          ResetPasswordRequestModel(email: email, newPassword: newPassword));
      return response.toDomain();
    });
  }

  @override
  Future<Result<UpdatePasswordEntity>> updatePassword(String oldPassword, String newPassword, String rePassword) async{
    String token = await authOfflineDataSource.getToken();
    return executeApiCall<UpdatePasswordEntity>(() async {
      var response = await authOnlineDataSource.updatePassword(token, UpdatePasswordRequestModel(oldPassword: oldPassword, password: newPassword, rePassword: rePassword));
      await authOfflineDataSource.saveToken(response.token??"");
      return response.toDomain();
    });
  }
}
