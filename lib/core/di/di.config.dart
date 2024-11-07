// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i6;

import '../../feature/exam/data/apis/api_services.dart' as _i8;
import '../../feature/exam/data/core/dio_provider.dart' as _i23;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i4;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i5;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source.dart'
    as _i9;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i10;
import '../../feature/exam/data/repositories/exam_questions_repo_impl.dart'
    as _i12;
import '../../feature/exam/data/repositories/exam_repo_impl.dart' as _i14;
import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i16;
import '../../feature/exam/domain/repositories/exam_repo.dart' as _i13;
import '../../feature/exam/domain/repositories/exams_quesions_repo.dart'
    as _i11;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i15;
import '../../feature/exam/domain/use_cases/usecases.dart' as _i17;
import '../../feature/exam/presentation/manager/exam_start_screen_manager/exam_start_view_model.dart'
    as _i18;
import '../../feature/exam/presentation/manager/home_managers/action_handler.dart'
    as _i21;
import '../../feature/exam/presentation/manager/home_managers/view_model.dart'
    as _i20;
import '../../feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart'
    as _i7;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart'
    as _i22;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart'
    as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.Dio>(() => networkModule.provideDio());
    gh.factory<_i4.OfflineDataSource>(() => _i5.OfflineDataSourceImpl());
    gh.factory<_i6.PrettyDioLogger>(() => networkModule.providerInterceptor());
    gh.factory<_i7.QuestionsScreenViewModel>(
        () => _i7.QuestionsScreenViewModel());
    gh.lazySingleton<_i8.ApiServices>(() => _i8.ApiServices(gh<_i3.Dio>()));
    gh.factory<_i9.OnlineDataSource>(
        () => _i10.OnlineDataSourceImpl(gh<_i8.ApiServices>()));
    gh.factory<_i11.ExamQuestionsRepo>(() => _i12.ExamQuestionsRepoImpl(
          gh<_i9.OnlineDataSource>(),
          gh<_i4.OfflineDataSource>(),
        ));
    gh.factory<_i13.ExamRepo>(() => _i14.ExamRepoImpl(
          gh<_i9.OnlineDataSource>(),
          gh<_i4.OfflineDataSource>(),
        ));
    gh.factory<_i15.HomeRepo>(() => _i16.HomeRepoImpl(
          gh<_i9.OnlineDataSource>(),
          gh<_i4.OfflineDataSource>(),
        ));
    gh.factory<_i17.UseCases>(() => _i17.UseCases(
          gh<_i15.HomeRepo>(),
          gh<_i13.ExamRepo>(),
          gh<_i11.ExamQuestionsRepo>(),
        ));
    gh.factory<_i18.ExamStartScreenViewModel>(
        () => _i18.ExamStartScreenViewModel(gh<_i17.UseCases>()));
    gh.factory<_i19.ExamsViewModel>(
        () => _i19.ExamsViewModel(gh<_i17.UseCases>()));
    gh.factory<_i20.HomeViewModel>(
        () => _i20.HomeViewModel(gh<_i17.UseCases>()));
    gh.singleton<_i21.ActionHandler>(() => _i21.ActionHandler(
          gh<_i17.UseCases>(),
          gh<_i20.HomeViewModel>(),
        ));
    gh.singleton<_i22.ExamsScreenActionHandler>(
        () => _i22.ExamsScreenActionHandler(
              gh<_i19.ExamsViewModel>(),
              gh<_i17.UseCases>(),
            ));
    return this;
  }
}

class _$NetworkModule extends _i23.NetworkModule {}
