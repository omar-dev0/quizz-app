import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';

abstract class AuthRepository{
  Future<LoginResponse?> login(String email,String password);
  void resetPassword();
}