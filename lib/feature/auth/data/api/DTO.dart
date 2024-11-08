import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domain;

abstract class DTO{

   static domain.User userDto(LoginResponse response){
    return domain.User(email: response.user?.email, username: response.user?.username, token: response.token,firstName: response.user?.firstName);
   }
}