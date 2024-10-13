import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

abstract class AuthOnlineDataSource{
  Future<LoginResponse?> login(String email,String password);
}