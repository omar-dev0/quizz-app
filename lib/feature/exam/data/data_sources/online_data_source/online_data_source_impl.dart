import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/helpers/shared_pref_hepler.dart';
import 'package:quizz_app/core/helpers/shared_pref_key.dart';
import 'package:quizz_app/feature/exam/data/apis/DTO/logout_response_model.dart';
import 'package:quizz_app/feature/exam/data/apis/api_services.dart';
import 'package:quizz_app/feature/exam/data/apis/apis_const.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/data/models/exam_by_examid/exam_by_response_model.dart';
import 'package:quizz_app/feature/exam/data/models/exam_question_models/exam_questions_reponse_model.dart';
import 'package:quizz_app/feature/exam/data/models/subject_models/subject_response.dart';

import '../../models/exam_by_subject_id_models/exams_by_subject_response.dart';


@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource{
  final ApiServices _apiServices;

  @factoryMethod
  OnlineDataSourceImpl(this._apiServices);
  @override
  Future<SubjectResponse> getSubjects() async{
    String? token = await SharedPrefHelper.getSecureString(SharedPrefKeys.token);
    return await _apiServices.getSubjects(token??"");
  }

  @override
  Future<ExamsBySubjectResponse> getExamBySubjectId(String id) async{
    String? token = await SharedPrefHelper.getSecureString(SharedPrefKeys.token);
    return await _apiServices.getExamsBySubjectId(token??"",id );
  }

  @override
  Future<ExamQuestionsReponseModel> getExamQuestionsByExamId(String id) async{
    String? token = await SharedPrefHelper.getSecureString(SharedPrefKeys.token);
    return await _apiServices.getExamQuestionsByExamId(token??"", id);
  }

  @override
  Future<ExamByIdResponseModel> getExamById(String id) async{
    String? token = await SharedPrefHelper.getSecureString(SharedPrefKeys.token);
    return await _apiServices.getExamById(token??"", id);
  }

  @override
  Future<LogoutResponseModel> logout(String token) async{
    return await _apiServices.logout(token);
  }

}