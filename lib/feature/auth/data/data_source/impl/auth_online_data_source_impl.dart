import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/data/api/api_services.dart';
import 'package:quizz_app/feature/auth/data/api/model/request/login_request.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

import '../contracts/auth_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource{
  ApiServices apiServices;
  @factoryMethod
  AuthOnlineDataSourceImpl(this.apiServices);

  @override
  Future<LoginResponse?> login(String email, String password) async {
     LoginRequest loginRequest = LoginRequest(email: email, password: password);
     LoginResponse response = await apiServices.login(loginRequest);
     return response;
  }

}