import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/sin_up/sign_up_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/data/core/end_points.dart';
import 'package:retrofit/retrofit.dart';
import 'model/request/login/Otp_code_request.dart';
import 'model/request/login/login_request.dart';
import 'model/response/login/Otp_code_response.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: EndPoints.authBaseUrl)
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(EndPoints.loginEndPoint)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(EndPoints.forgetPasswordEntPoint)
  Future<OtpCodeResponse> getOtpCode(@Body() OtpCodeRequest otpRequest);

  @POST(EndPoints.signUp)
  Future<void> signUp(@Body() SignUpRequest request);



  @GET("/${EndPoints.logout}")
  Future<String> logout(@Header("token") String token);
}
