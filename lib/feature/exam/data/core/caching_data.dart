import 'package:hive/hive.dart';

import '../../../../core/resources/app_constant.dart';
import '../../domain/entities/subject_item_entity.dart';
import '../apis/DTO/subject_dto.dart';
import '../data_sources/offline_data_source/subject_cached_model.dart';

abstract class CachingData{
  static void cachedSubject(List<SubjectItemEntity> subjects) {
    var box = Hive.box<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
    box.addAll(SubjectDIO.cacheSubject(subjects));
  }
}