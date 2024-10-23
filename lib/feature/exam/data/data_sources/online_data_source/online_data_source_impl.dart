import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/data/apis/api_services.dart';
import 'package:quizz_app/feature/exam/data/data_sources/online_data_source/online_data_source.dart';
import 'package:quizz_app/feature/exam/data/models/Subjects.dart';


@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource{
  final ApiServices _apiServices;

  @factoryMethod
  OnlineDataSourceImpl(this._apiServices);
  @override
  Future<List<Subjects>> getSubjects() async{

    return await _apiServices.getSubjects();
  }

}