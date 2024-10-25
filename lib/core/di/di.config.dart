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
import '../../feature/exam/data/data_sources/online_data_source/online_data_source.dart'
    as _i71;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i685;
import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i815;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i387;
import '../../feature/exam/domain/use_cases/home_usecase.dart' as _i341;
import '../../feature/exam/presentation/manager/view_model.dart' as _i600;

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
    gh.lazySingleton<_i578.ApiServices>(
        () => _i578.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i71.OnlineDataSource>(
        () => _i685.OnlineDataSourceImpl(gh<_i578.ApiServices>()));
    gh.factory<_i387.HomeRepo>(
        () => _i815.HomeRepoImpl(gh<_i71.OnlineDataSource>()));
    gh.factory<_i341.HomeUseCase>(
        () => _i341.HomeUseCase(gh<_i387.HomeRepo>()));
    gh.factory<_i600.HomeViewModel>(
        () => _i600.HomeViewModel(gh<_i341.HomeUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i419.NetworkModule {}
