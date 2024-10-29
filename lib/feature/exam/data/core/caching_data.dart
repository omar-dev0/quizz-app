import 'package:hive/hive.dart';

import '../../../../core/resources/app_constant.dart';
import '../../domain/entities/subject_item_entity.dart';
import '../data_sources/offline_data_source/subject_cached_model.dart';

abstract class CachingData{
  static void cachedSubject(List<SubjectItemEntity> subjects) {
    var box = Hive.box<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
    box.addAll(cacheSubject(subjects));
  }

  static List<SubjectCachedModel> cacheSubject(List<SubjectItemEntity> list){
    List<SubjectCachedModel> subjects = [];
    for(var subject in list){
      subjects.add(
          SubjectCachedModel(subject.id, subject.name, subject.icon)
      );
    }
    return subjects;
  }
}