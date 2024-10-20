import 'package:dio/dio.dart';

import 'error_message.dart';

abstract class Failure{
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure{
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e){
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(ErrorMessage.connectionTimeOut);
      case DioExceptionType.sendTimeout:
        return ServerFailure(ErrorMessage.sendingTimeOut);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(ErrorMessage.connectionTimeOut);
      case DioExceptionType.badCertificate:
        return ServerFailure(ErrorMessage.badCertificateError);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(ErrorMessage.cancelError);
      case DioExceptionType.connectionError:
        return ServerFailure(ErrorMessage.connectionError);
      case DioExceptionType.unknown:
        return ServerFailure(ErrorMessage.unKnown);
      default:
        return ServerFailure(ErrorMessage.defaultError);
    }
  }

  factory ServerFailure.fromResponse(int statuesCode, dynamic response){
    if(statuesCode == 404){
      return ServerFailure(ErrorMessage.requestNotFount);
    }else if(statuesCode >= 500){
      return ServerFailure(ErrorMessage.serverFailure);
    }
    return ServerFailure(response['error']['message']);
  }
}
