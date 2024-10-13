import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/api_services.dart';
import 'package:quizz_app/feature/auth/data/api/excute_api_call.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/Otp_code_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/login_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/Otp_code_response.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

import '../../../domain/common/api_result.dart';
import '../contracts/auth_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource{

  ApiServices apiServices;
  @factoryMethod
  AuthOnlineDataSourceImpl(this.apiServices);

  @override
  Future<Result<LoginResponse?>> login(String email, String password) async {
     LoginRequest loginRequest = LoginRequest(email: email, password: password);
     return await executeApiCall((){
       return apiServices.login(loginRequest);
     });

  }

  @override
  Future<OtpCodeResponse?> getOtpCode(String email) async {
    OtpCodeRequest otpCodeRequest = OtpCodeRequest(email: email);
    OtpCodeResponse response = await apiServices.getOtpCode(otpCodeRequest);
    return response;
  }

}