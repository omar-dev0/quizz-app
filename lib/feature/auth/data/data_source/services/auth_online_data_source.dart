import '../../../domain/common/api_result.dart';
import '../../../domain/model/user.dart';

abstract class AuthOnlineDataSource{
  Future<Result<User?>> login(String email,String password);
}