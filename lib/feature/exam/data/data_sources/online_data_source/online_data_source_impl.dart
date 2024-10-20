import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/apis/api_services.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/data/models/Subject_response.dart';


@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource{
  ApiServices _apiServices;
  OnlineDataSourceImpl(this._apiServices);
  @override
  Future<List<SubjectResponse>> getSubjects() async{

    return await _apiServices.getSubjects();
  }

}