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

import '../../feature/auth/data/api/api_services.dart' as _i14;
import '../../feature/auth/data/data_source/contracts/auth_data_source.dart'
    as _i3;
import '../../feature/auth/data/data_source/impl/auth_offline_data_source_impl.dart'
    as _i4;
import '../../feature/auth/data/data_source/impl/auth_online_data_source_impl.dart'
    as _i16;
import '../../feature/auth/data/repository/auth_repository_impl.dart' as _i18;
import '../../feature/auth/domain/repository/auth_repository.dart' as _i17;
import '../../feature/auth/domain/use_cases/forget_password_use_case.dart'
    as _i19;
import '../../feature/auth/domain/use_cases/login_use_case.dart' as _i21;
import '../../feature/auth/domain/use_cases/logout_use_case.dart' as _i23;
import '../../feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart'
    as _i20;
import '../../feature/auth/presentation/login/view_model/login_view_model.dart'
    as _i22;
import '../../feature/auth/presentation/logout/view_model/logout_view_model.dart'
    as _i24;
import '../../feature/auth/presentation/profile/view_model/profile_view_model.dart'
    as _i10;
import '../../feature/auth/presentation/registration/viewmodel/registration_cubit.dart'
    as _i27;
import '../../feature/auth/presentation/update_password/view_model/change_password_viewmodel.dart'
    as _i5;
import '../../feature/exam/data/apis/api_services.dart' as _i15;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i7;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i8;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source.dart'
    as _i25;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i26;
import '../../feature/exam/data/repositories/exam_by_id_repo_impl.dart' as _i29;
import '../../feature/exam/data/repositories/exam_questions_repo_impl.dart'
    as _i31;
import '../../feature/exam/data/repositories/exam_repo_impl.dart' as _i33;
import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i35;
import '../../feature/exam/data/repositories/logout_repo_impl.dart' as _i37;
import '../../feature/exam/domain/repositories/exam_by_id_repo.dart' as _i28;
import '../../feature/exam/domain/repositories/exam_repo.dart' as _i32;
import '../../feature/exam/domain/repositories/exams_quesions_repo.dart'
    as _i30;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i34;
import '../../feature/exam/domain/repositories/logout_repo.dart' as _i36;
import '../../feature/exam/domain/use_cases/logout_use_case.dart' as _i38;
import '../../feature/exam/domain/use_cases/usecases.dart' as _i39;
import '../../feature/exam/presentation/manager/exam_start_screen_manager/exam_start_view_model.dart'
    as _i40;
import '../../feature/exam/presentation/manager/home_managers/action_handler.dart'
    as _i44;
import '../../feature/exam/presentation/manager/home_managers/view_model.dart'
    as _i42;
import '../../feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart'
    as _i11;
import '../../feature/exam/presentation/manager/reset_password/reset_password_view_model.dart'
    as _i12;
import '../../feature/exam/presentation/manager/result_manager/result_scree_view_model.dart'
    as _i43;
import '../../feature/exam/presentation/manager/result_screen_details/result_screen_viewmodel.dart'
    as _i13;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart'
    as _i45;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart'
    as _i41;
import '../dio/dio_provider.dart' as _i46;

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
    gh.factory<_i11.QuestionsScreenViewModel>(
        () => _i11.QuestionsScreenViewModel());
    gh.factory<_i12.ResetPasswordViewModel>(
        () => _i12.ResetPasswordViewModel());
    gh.factory<_i13.ResultDetailsViewModel>(
        () => _i13.ResultDetailsViewModel());
    gh.singleton<_i14.ApiServices>(() => _i14.ApiServices(gh<_i6.Dio>()));
    gh.lazySingleton<_i15.ApiServices>(() => _i15.ApiServices(gh<_i6.Dio>()));
    gh.factory<_i3.AuthOnlineDataSource>(
        () => _i16.AuthOnlineDataSourceImpl(gh<_i14.ApiServices>()));
    gh.factory<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
          gh<_i3.AuthOnlineDataSource>(),
          gh<_i3.AuthOfflineDataSource>(),
        ));
    gh.factory<_i19.ForgetPasswordUseCase>(
        () => _i19.ForgetPasswordUseCase(gh<_i17.AuthRepository>()));
    gh.factory<_i20.ForgetPasswordViewModel>(
        () => _i20.ForgetPasswordViewModel(gh<_i19.ForgetPasswordUseCase>()));
    gh.factory<_i21.LoginUseCase>(
        () => _i21.LoginUseCase(gh<_i17.AuthRepository>()));
    gh.factory<_i22.LoginViewModel>(
        () => _i22.LoginViewModel(gh<_i21.LoginUseCase>()));
    gh.factory<_i23.LogoutUseCase>(
        () => _i23.LogoutUseCase(gh<_i17.AuthRepository>()));
    gh.factory<_i24.LogoutViewModel>(
        () => _i24.LogoutViewModel(gh<_i23.LogoutUseCase>()));
    gh.factory<_i25.OnlineDataSource>(
        () => _i26.OnlineDataSourceImpl(gh<_i15.ApiServices>()));
    gh.factory<_i27.RegistrationViewModel>(
        () => _i27.RegistrationViewModel(gh<_i17.AuthRepository>()));
    gh.factory<_i28.ExamByIdRepo>(() => _i29.ExamByIdRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i30.ExamQuestionsRepo>(() => _i31.ExamQuestionsRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i32.ExamRepo>(() => _i33.ExamRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i34.HomeRepo>(() => _i35.HomeRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i36.LogoutRepo>(
        () => _i37.LogoutRepoImpl(gh<_i25.OnlineDataSource>()));
    gh.factory<_i38.LogoutUseCase>(
        () => _i38.LogoutUseCase(gh<_i36.LogoutRepo>()));
    gh.factory<_i39.UseCases>(() => _i39.UseCases(
          gh<_i34.HomeRepo>(),
          gh<_i32.ExamRepo>(),
          gh<_i30.ExamQuestionsRepo>(),
          gh<_i28.ExamByIdRepo>(),
        ));
    gh.factory<_i40.ExamStartScreenViewModel>(
        () => _i40.ExamStartScreenViewModel(gh<_i39.UseCases>()));
    gh.factory<_i41.ExamsViewModel>(
        () => _i41.ExamsViewModel(gh<_i39.UseCases>()));
    gh.factory<_i42.HomeViewModel>(
        () => _i42.HomeViewModel(gh<_i39.UseCases>()));
    gh.factory<_i43.ResultScreenViewModel>(
        () => _i43.ResultScreenViewModel(gh<_i39.UseCases>()));
    gh.singleton<_i44.ActionHandler>(() => _i44.ActionHandler(
          gh<_i39.UseCases>(),
          gh<_i42.HomeViewModel>(),
        ));
    gh.singleton<_i45.ExamsScreenActionHandler>(
        () => _i45.ExamsScreenActionHandler(
              gh<_i41.ExamsViewModel>(),
              gh<_i39.UseCases>(),
            ));
    return this;
  }
}

class _$DioProvider extends _i46.DioProvider {}
