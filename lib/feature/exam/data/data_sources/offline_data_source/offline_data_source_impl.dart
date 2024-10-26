import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';

@Injectable(as : OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource{
  @override
  Future<List<SubjectCachedModel>> getSubjects() async{
     var box = Hive.box<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
     return box.values.toList();
  }
}