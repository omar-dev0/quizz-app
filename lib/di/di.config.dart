// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i7;

import '../feature/auth/data/api/api_services.dart' as _i9;
import '../feature/auth/data/core/dio_provider.dart' as _i18;
import '../feature/auth/data/data_source/contracts/auth_data_source.dart'
    as _i3;
import '../feature/auth/data/data_source/impl/auth_offline_data_source_impl.dart'
    as _i4;
import '../feature/auth/data/data_source/impl/auth_online_data_source_impl.dart'
    as _i10;
import '../feature/auth/data/repository/auth_repository_impl.dart' as _i12;
import '../feature/auth/domain/repository/auth_repository.dart' as _i11;
import '../feature/auth/domain/use_cases/forget_password_use_case.dart' as _i13;
import '../feature/auth/domain/use_cases/login_use_case.dart' as _i15;
import '../feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart'
    as _i14;
import '../feature/auth/presentation/login/view_model/login_view_model.dart'
    as _i16;
import '../feature/auth/presentation/profile/view_model/profile_view_model.dart'
    as _i8;
import '../feature/auth/presentation/registration/viewmodel/registration_cubit.dart'
    as _i17;
import '../feature/auth/presentation/update_password/view_model/change_password_viewmodel.dart'
    as _i5;

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
    final dioProvider = _$DioProvider();
    gh.factory<_i3.AuthOfflineDataSource>(
        () => _i4.AuthOfflineDataSourceImpl());
    gh.factory<_i5.ChangePasswordViewModel>(
        () => _i5.ChangePasswordViewModel());
    gh.lazySingleton<_i6.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i7.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.factory<_i8.ProfileViewModel>(() => _i8.ProfileViewModel());
    gh.singleton<_i9.ApiServices>(() => _i9.ApiServices(gh<_i6.Dio>()));
    gh.factory<_i3.AuthOnlineDataSource>(
        () => _i10.AuthOnlineDataSourceImpl(gh<_i9.ApiServices>()));
    gh.factory<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
          gh<_i3.AuthOnlineDataSource>(),
          gh<_i3.AuthOfflineDataSource>(),
        ));
    gh.factory<_i13.ForgetPasswordUseCase>(
        () => _i13.ForgetPasswordUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i14.ForgetPasswordViewModel>(
        () => _i14.ForgetPasswordViewModel(gh<_i13.ForgetPasswordUseCase>()));
    gh.factory<_i15.LoginUseCase>(
        () => _i15.LoginUseCase(gh<_i11.AuthRepository>()));
    gh.factory<_i16.LoginViewModel>(
        () => _i16.LoginViewModel(gh<_i15.LoginUseCase>()));
    gh.factory<_i17.RegistrationViewModel>(
        () => _i17.RegistrationViewModel(gh<_i11.AuthRepository>()));
    return this;
  }
}

class _$DioProvider extends _i18.DioProvider {}
