import 'package:quizz_app/feature/auth/domain/common/api_result.dart';

Future<Result<T>> executeApiCall<T>(Future<T> Function()  apiCall) async{
  try{
    final response = await apiCall.call();
    return Success(response); }
    catch (e){
    return Fail(e as Exception);
    }
}