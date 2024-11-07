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

import '../../feature/exam/data/apis/api_services.dart' as _i7;
import '../../feature/exam/data/core/dio_provider.dart' as _i17;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i4;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i5;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source.dart'
    as _i8;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i9;
import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i11;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i10;
import '../../feature/exam/domain/use_cases/usecase.dart' as _i12;
import '../../feature/exam/presentation/manager/home_managers/action_handler.dart'
    as _i15;
import '../../feature/exam/presentation/manager/home_managers/view_model.dart'
    as _i14;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart'
    as _i16;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart'
    as _i13;

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
    gh.lazySingleton<_i7.ApiServices>(() => _i7.ApiServices(gh<_i3.Dio>()));
    gh.factory<_i8.OnlineDataSource>(
        () => _i9.OnlineDataSourceImpl(gh<_i7.ApiServices>()));
    gh.factory<_i10.HomeRepo>(() => _i11.HomeRepoImpl(
          gh<_i8.OnlineDataSource>(),
          gh<_i4.OfflineDataSource>(),
        ));
    gh.factory<_i12.UseCase>(() => _i12.UseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i13.ExamsViewModel>(
        () => _i13.ExamsViewModel(gh<_i12.UseCase>()));
    gh.factory<_i14.HomeViewModel>(
        () => _i14.HomeViewModel(gh<_i12.UseCase>()));
    gh.singleton<_i15.ActionHandler>(() => _i15.ActionHandler(
          gh<_i12.UseCase>(),
          gh<_i14.HomeViewModel>(),
        ));
    gh.singleton<_i16.ExamsScreenActionHandler>(
        () => _i16.ExamsScreenActionHandler(
              gh<_i13.ExamsViewModel>(),
              gh<_i12.UseCase>(),
            ));
    return this;
  }
}

class _$NetworkModule extends _i17.NetworkModule {}
