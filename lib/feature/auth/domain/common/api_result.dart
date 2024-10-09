import 'package:dio/src/dio_exception.dart';

abstract class Result<T>{}

class Success<T> implements Result<T>
{
  T? data;
  Success({this.data});
}

class Fail<T> implements Result<T>
{
  Exception? error;
  Fail(DioException ex, {this.error});
}