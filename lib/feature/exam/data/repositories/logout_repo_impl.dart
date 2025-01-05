
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/feature/auth/data/api/excute_api_call.dart';
import 'package:quizz_app/feature/auth/data/data_source/cached_token.dart';
import 'package:quizz_app/feature/auth/domain/common/api_result.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/domain/entities/logout_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/logout_repo.dart';

@Injectable(as: LogoutRepo)
class LogoutRepoImpl implements LogoutRepo{
  final OnlineDataSource _onlineDataSource;

  LogoutRepoImpl(this._onlineDataSource);
  @override
  Future<Result<LogoutEntity>> logout() async{
   var box = Hive.box<CachedToken>(AppConstant.ktoken);
    return await executeApiCall<LogoutEntity>(()async{
        var response = await _onlineDataSource.logout(box.get(AppConstant.ktoken)!.token!);
        return response.toDomain();
    });

  }

}