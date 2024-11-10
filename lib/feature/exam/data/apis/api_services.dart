import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/models/exam_by_examid/exam_by_response_model.dart';
import 'package:quizz_app/feature/exam/data/models/exam_by_subject_id_models/exams_by_subject_response.dart';
import 'package:quizz_app/feature/exam/data/models/exam_question_models/exam_questions_reponse_model.dart';
import 'package:quizz_app/feature/exam/data/models/subject_models/subject_response.dart';
import 'package:retrofit/retrofit.dart';

import 'apis_const.dart';

part 'api_services.g.dart';
@lazySingleton
@RestApi(baseUrl: ApiConst.baseUrl)
abstract class ApiServices{

  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @GET("/${ApiConst.subjecstId}")
  Future<SubjectResponse> getSubjects(@Header("token") String token);

  @GET("/${ApiConst.exam}")
  Future<ExamsBySubjectResponse> getExamsBySubjectId(@Header("token") String token, @Query("subject") String id);

  @GET("/${ApiConst.questions}")
  Future<ExamQuestionsReponseModel> getExamQuestionsByExamId(@Header("token") String token, @Query("exam") String id);

  @GET("/${ApiConst.exam}/{examId}")
  Future<ExamByIdResponseModel> getExamById(@Header("token") String token, @Path("examId") String id);


}