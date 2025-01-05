import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/api_services.dart';
import 'package:quizz_app/feature/auth/data/api/excute_api_call.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/login/login_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/reset_password_request_model.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/sin_up/sign_up_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/verify_otp_code_request_model.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/reset_password_response_model.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/verify_otp_response_model.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domine;

import '../../../domain/common/api_result.dart';
import '../../api/model/request/login/Otp_code_request.dart';
import '../../api/model/response/login/Otp_code_response.dart';
import '../contracts/auth_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource{

  ApiServices _apiServices;
  @factoryMethod
  AuthOnlineDataSourceImpl(this._apiServices);

  @override
  Future<Result<LoginResponse?>> login(String email, String password) async {
     LoginRequest loginRequest = LoginRequest(email: email, password: password);
     return await executeApiCall<LoginResponse?>((){
       return _apiServices.login(loginRequest);
     });

  }

  @override
  Future<OtpCodeResponse> getOtpCode(String email) async {
    return await _apiServices.getOtpCode(OtpCodeRequest(email: email));
  }

  @override
  Future<Result<void>> signUp(domine.User appUser, String password, String confirmPassword)async{
    return await executeApiCall<void>((){
      final SignUpRequest request = SignUpRequest(
          email: appUser.email!,
          rePassword: confirmPassword,
          password: password,
          lastName: appUser.lastName!,
          firstName: appUser.firstName!,
          userName: appUser.username!,
          phone: appUser.phone!);
      final response = _apiServices.signUp(request);
      return response;
    });
  }

  @override
  Future<String> logout(String token)async {
    return await _apiServices.logout(token);
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(String otpCode) async{
    return await _apiServices.verifyOtp(VeriftOtpCodeReuestModel(resetCode: otpCode));
  }


  @override
  Future<ResetPasswordResponseModel> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel) async{
    return await _apiServices.resetPassword(resetPasswordRequestModel);
  }

}