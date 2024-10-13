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

import '../../feature/auth/data/api/api_services.dart' as _i193;
import '../../feature/auth/data/data_source/contracts/auth_data_source.dart'
    as _i480;
import '../../feature/auth/data/data_source/impl/auth_online_data_source_impl.dart'
    as _i762;
import '../../feature/auth/data/repository/auth_repository_impl.dart' as _i648;
import '../../feature/auth/domain/repository/auth_repository.dart' as _i884;
import '../../feature/auth/domain/use_cases/forget_password_use_case.dart'
    as _i1018;
import '../../feature/auth/domain/use_cases/login_use_case.dart' as _i561;
import '../../feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart'
    as _i561;
import '../../feature/auth/presentation/login/view_model/login_view_model.dart'
    as _i1046;

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
    gh.lazySingleton<_i193.ApiServices>(
        () => _i193.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i480.AuthOnlineDataSource>(
        () => _i762.AuthOnlineDataSourceImpl(gh<_i193.ApiServices>()));
    gh.factory<_i884.AuthRepository>(
        () => _i648.AuthRepositoryImpl(gh<_i480.AuthOnlineDataSource>()));
    gh.factory<_i1018.ForgetPasswordUseCase>(
        () => _i1018.ForgetPasswordUseCase(gh<_i884.AuthRepository>()));
    gh.factory<_i561.LoginUseCase>(
        () => _i561.LoginUseCase(gh<_i884.AuthRepository>()));
    gh.factory<_i561.ForgetPasswordViewModel>(() =>
        _i561.ForgetPasswordViewModel(gh<_i1018.ForgetPasswordUseCase>()));
    gh.factory<_i1046.LoginViewModel>(
        () => _i1046.LoginViewModel(gh<_i561.LoginUseCase>()));
    return this;
  }
}
