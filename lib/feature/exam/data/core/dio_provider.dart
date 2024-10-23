
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quizz_app/feature/exam/data/apis/apis_const.dart';

import '../../../../core/di/di.dart';

@module
abstract class NetworkModule{

  @lazySingleton
  Dio provideDio(){
    final dio = Dio();
    dio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        baseUrl: ApiConst.baseUrl
    );
    dio.interceptors.add(getIt<PrettyDioLogger>());

    return dio;
  }
  PrettyDioLogger providerInterceptor() {
    return PrettyDioLogger(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true);
  }

}

