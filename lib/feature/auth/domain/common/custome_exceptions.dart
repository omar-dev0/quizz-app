import 'package:dio/dio.dart';

class ServerError implements Exception{
  String? codeError;
  String? error;
  ServerError({this.error , this.codeError});
}

class DioHttpException implements Exception{
  DioException? exception;
  DioHttpException(this.exception);
}

class IncorrectData implements Exception{
  String? codeError;
  String? error;
  IncorrectData({this.error , this.codeError});
}