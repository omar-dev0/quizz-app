// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../feature/exam/data/apis/api_services.dart' as _i578;
import '../../feature/exam/data/core/dio_provider.dart' as _i419;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i82;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i505;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source.dart'
    as _i71;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i685;
import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i815;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i387;
import '../../feature/exam/domain/use_cases/usecase.dart' as _i1009;
import '../../feature/exam/presentation/manager/home_managers/action_handler.dart'
    as _i831;
import '../../feature/exam/presentation/manager/home_managers/view_model.dart'
    as _i399;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart'
    as _i339;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart'
    as _i820;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i528.PrettyDioLogger>(
        () => networkModule.providerInterceptor());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.factory<_i82.OfflineDataSource>(() => _i505.OfflineDataSourceImpl());
    gh.lazySingleton<_i578.ApiServices>(
        () => _i578.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i71.OnlineDataSource>(
        () => _i685.OnlineDataSourceImpl(gh<_i578.ApiServices>()));
    gh.factory<_i387.HomeRepo>(() => _i815.HomeRepoImpl(
          gh<_i71.OnlineDataSource>(),
          gh<_i82.OfflineDataSource>(),
        ));
    gh.factory<_i1009.UseCase>(() => _i1009.UseCase(gh<_i387.HomeRepo>()));
    gh.factory<_i399.HomeViewModel>(
        () => _i399.HomeViewModel(gh<_i1009.UseCase>()));
    gh.factory<_i820.ExamsViewModel>(
        () => _i820.ExamsViewModel(gh<_i1009.UseCase>()));
    gh.singleton<_i339.ExamsScreenActionHandler>(
        () => _i339.ExamsScreenActionHandler(
              gh<_i820.ExamsViewModel>(),
              gh<_i1009.UseCase>(),
            ));
    gh.singleton<_i831.ActionHandler>(() => _i831.ActionHandler(
          gh<_i1009.UseCase>(),
          gh<_i399.HomeViewModel>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i419.NetworkModule {}
