import 'package:quizz_app/feature/exam/domain/entities/logout_entity.dart';

import '../../../auth/domain/common/api_result.dart';

abstract interface class LogoutRepo{
  Future<Result<LogoutEntity>>logout();
}