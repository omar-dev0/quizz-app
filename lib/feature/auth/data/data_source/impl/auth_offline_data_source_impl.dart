import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/constant/hive_box.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart';

import '../contracts/auth_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource{
  @override
  List<LoginResponse> login() {
    var box = Hive.box<LoginResponse>(HiveBox.userBox);
    return box.values.toList();
  }
}