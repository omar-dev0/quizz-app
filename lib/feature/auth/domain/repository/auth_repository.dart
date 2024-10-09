import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import '../model/user.dart';

abstract class AuthRepository{
  Future<Result<User?>> login(String email,String password);
}