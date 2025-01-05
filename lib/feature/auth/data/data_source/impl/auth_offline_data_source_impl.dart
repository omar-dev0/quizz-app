import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/constant/hive_box.dart';
import 'package:quizz_app/core/helpers/shared_pref_hepler.dart';
import 'package:quizz_app/core/helpers/shared_pref_key.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';

import '../contracts/auth_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource{
  @override
  Future<void> deleteToken() async{
    await SharedPrefHelper.removeSecureString(SharedPrefKeys.token);
  }

  @override
  Future<String> getToken() async{
    return await SharedPrefHelper.getSecureString(SharedPrefKeys.token)??"";
  }

  @override
  Future<void> saveToken(String token) async{
    await SharedPrefHelper.setSecureString(SharedPrefKeys.token, token);
  }

}