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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i9;

import '../../feature/auth/data/api/api_services.dart' as _i11;
import '../../feature/auth/data/data_source/contracts/auth_data_source.dart'
    as _i3;
import '../../feature/auth/data/data_source/impl/auth_offline_data_source_impl.dart'
    as _i4;
import '../../feature/auth/data/data_source/impl/auth_online_data_source_impl.dart'
    as _i13;
import '../../feature/auth/data/repository/auth_repository_impl.dart' as _i15;
import '../../feature/auth/domain/repository/auth_repository.dart' as _i14;
import '../../feature/auth/domain/use_cases/forget_password_use_case.dart'
    as _i16;
import '../../feature/auth/domain/use_cases/login_use_case.dart' as _i18;
import '../../feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart'
    as _i17;
import '../../feature/auth/presentation/login/view_model/login_view_model.dart'
    as _i19;
import '../../feature/auth/presentation/profile/view_model/profile_view_model.dart'
    as _i10;
import '../../feature/auth/presentation/registration/viewmodel/registration_cubit.dart'
    as _i22;
import '../../feature/auth/presentation/update_password/view_model/change_password_viewmodel.dart'
    as _i5;
import '../../feature/exam/data/apis/api_services.dart' as _i12;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i7;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i8;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source.dart'
    as _i20;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i21;
import '../../feature/exam/data/repositories/exam_questions_repo_impl.dart'
    as _i24;
import '../../feature/exam/data/repositories/exam_repo_impl.dart' as _i26;
import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i28;
import '../../feature/exam/domain/repositories/exam_repo.dart' as _i25;
import '../../feature/exam/domain/repositories/exams_quesions_repo.dart'
    as _i23;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i27;
import '../../feature/exam/domain/use_cases/usecases.dart' as _i29;
import '../../feature/exam/presentation/manager/exam_start_screen_manager/exam_start_view_model.dart'
    as _i30;
import '../../feature/exam/presentation/manager/home_managers/action_handler.dart'
    as _i33;
import '../../feature/exam/presentation/manager/home_managers/view_model.dart'
    as _i32;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart'
    as _i34;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart'
    as _i31;
import '../dio/dio_provider.dart' as _i35;

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
    gh.factory<_i7.OfflineDataSource>(() => _i8.OfflineDataSourceImpl());
    gh.lazySingleton<_i9.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.factory<_i10.ProfileViewModel>(() => _i10.ProfileViewModel());
    gh.singleton<_i11.ApiServices>(() => _i11.ApiServices(gh<_i6.Dio>()));
    gh.lazySingleton<_i12.ApiServices>(() => _i12.ApiServices(gh<_i6.Dio>()));
    gh.factory<_i3.AuthOnlineDataSource>(
        () => _i13.AuthOnlineDataSourceImpl(gh<_i11.ApiServices>()));
    gh.factory<_i14.AuthRepository>(() => _i15.AuthRepositoryImpl(
          gh<_i3.AuthOnlineDataSource>(),
          gh<_i3.AuthOfflineDataSource>(),
        ));
    gh.factory<_i16.ForgetPasswordUseCase>(
        () => _i16.ForgetPasswordUseCase(gh<_i14.AuthRepository>()));
    gh.factory<_i17.ForgetPasswordViewModel>(
        () => _i17.ForgetPasswordViewModel(gh<_i16.ForgetPasswordUseCase>()));
    gh.factory<_i18.LoginUseCase>(
        () => _i18.LoginUseCase(gh<_i14.AuthRepository>()));
    gh.factory<_i19.LoginViewModel>(
        () => _i19.LoginViewModel(gh<_i18.LoginUseCase>()));
    gh.factory<_i20.OnlineDataSource>(
        () => _i21.OnlineDataSourceImpl(gh<_i12.ApiServices>()));
    gh.factory<_i22.RegistrationViewModel>(
        () => _i22.RegistrationViewModel(gh<_i14.AuthRepository>()));
    gh.factory<_i23.ExamQuestionsRepo>(() => _i24.ExamQuestionsRepoImpl(
          gh<_i20.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i25.ExamRepo>(() => _i26.ExamRepoImpl(
          gh<_i20.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i27.HomeRepo>(() => _i28.HomeRepoImpl(
          gh<_i20.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i29.UseCases>(() => _i29.UseCases(
          gh<_i27.HomeRepo>(),
          gh<_i25.ExamRepo>(),
          gh<_i23.ExamQuestionsRepo>(),
        ));
    gh.factory<_i30.ExamStartScreenViewModel>(
        () => _i30.ExamStartScreenViewModel(gh<_i29.UseCases>()));
    gh.factory<_i31.ExamsViewModel>(
        () => _i31.ExamsViewModel(gh<_i29.UseCases>()));
    gh.factory<_i32.HomeViewModel>(
        () => _i32.HomeViewModel(gh<_i29.UseCases>()));
    gh.singleton<_i33.ActionHandler>(() => _i33.ActionHandler(
          gh<_i29.UseCases>(),
          gh<_i32.HomeViewModel>(),
        ));
    gh.singleton<_i34.ExamsScreenActionHandler>(
        () => _i34.ExamsScreenActionHandler(
              gh<_i31.ExamsViewModel>(),
              gh<_i29.UseCases>(),
            ));
    return this;
  }
}

class _$DioProvider extends _i35.DioProvider {}
