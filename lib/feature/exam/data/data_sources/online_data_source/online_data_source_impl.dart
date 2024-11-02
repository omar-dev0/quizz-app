import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/apis/api_services.dart';
import 'package:quizz_app/feature/exam/data/apis/apis_const.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/data/models/subject_models/subject_response.dart';

import '../../models/exam_by_subject_id_models/exams_by_subject_response.dart';


@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource{
  final ApiServices _apiServices;

  @factoryMethod
  OnlineDataSourceImpl(this._apiServices);
  @override
  Future<SubjectResponse> getSubjects() async{
    return await _apiServices.getSubjects(ApiConst.testToken);
  }

  @override
  Future<ExamsBySubjectResponse> getExamById(String id) async{
    return await _apiServices.getExamsBySubjectId(ApiConst.testToken,id );
  }
}