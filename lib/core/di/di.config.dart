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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i10;

import '../../feature/auth/data/api/api_services.dart' as _i15;
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
import '../../feature/auth/domain/use_cases/update_password_use_case.dart'
    as _i28;
import '../../feature/auth/presentation/forget_password/viewModel/forget_password_view_model.dart'
    as _i20;
import '../../feature/auth/presentation/login/view_model/login_view_model.dart'
    as _i22;
import '../../feature/auth/presentation/logout/view_model/logout_view_model.dart'
    as _i24;
import '../../feature/auth/presentation/profile/view_model/profile_view_model.dart'
    as _i11;
import '../../feature/auth/presentation/registration/viewmodel/registration_cubit.dart'
    as _i27;
import '../../feature/auth/presentation/update_password/view_model/change_password_viewmodel.dart'
    as _i5;
import '../../feature/exam/data/apis/api_services.dart' as _i14;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source.dart'
    as _i7;
import '../../feature/exam/data/data_sources/offline_data_source/offline_data_source_impl.dart'
    as _i8;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source.dart'
    as _i25;
import '../../feature/exam/data/data_sources/online_data_source/online_data_source_impl.dart'
    as _i26;
import '../../feature/exam/data/repositories/exam_by_id_repo_impl.dart' as _i30;
import '../../feature/exam/data/repositories/exam_questions_repo_impl.dart'
    as _i32;
import '../../feature/exam/data/repositories/exam_repo_impl.dart' as _i34;
import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i36;
import '../../feature/exam/data/repositories/logout_repo_impl.dart' as _i38;
import '../../feature/exam/domain/repositories/exam_by_id_repo.dart' as _i29;
import '../../feature/exam/domain/repositories/exam_repo.dart' as _i33;
import '../../feature/exam/domain/repositories/exams_quesions_repo.dart'
    as _i31;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i35;
import '../../feature/exam/domain/repositories/logout_repo.dart' as _i37;
import '../../feature/exam/domain/use_cases/logout_use_case.dart' as _i39;
import '../../feature/exam/domain/use_cases/usecases.dart' as _i41;
import '../../feature/exam/presentation/manager/exam_start_screen_manager/exam_start_view_model.dart'
    as _i42;
import '../../feature/exam/presentation/manager/home_managers/action_handler.dart'
    as _i46;
import '../../feature/exam/presentation/manager/home_managers/view_model.dart'
    as _i44;
import '../../feature/exam/presentation/manager/one_exam_result/one_exam_result_view_model.dart'
    as _i9;
import '../../feature/exam/presentation/manager/questions_screen_manager/questions_view_model.dart'
    as _i12;
import '../../feature/exam/presentation/manager/reset_password/reset_password_view_model.dart'
    as _i40;
import '../../feature/exam/presentation/manager/result_manager/result_scree_view_model.dart'
    as _i45;
import '../../feature/exam/presentation/manager/result_screen_details/result_screen_viewmodel.dart'
    as _i13;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_screen_action_handler.dart'
    as _i47;
import '../../feature/exam/presentation/manager/subject_exam_manager/exams_view_model.dart'
    as _i43;
import '../dio/dio_provider.dart' as _i48;

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
    gh.factory<_i9.OneExamResultViewModel>(() => _i9.OneExamResultViewModel());
    gh.lazySingleton<_i10.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.factory<_i11.ProfileViewModel>(() => _i11.ProfileViewModel());
    gh.factory<_i12.QuestionsScreenViewModel>(
        () => _i12.QuestionsScreenViewModel());
    gh.factory<_i13.ResultDetailsViewModel>(
        () => _i13.ResultDetailsViewModel());
    gh.lazySingleton<_i14.ApiServices>(() => _i14.ApiServices(gh<_i6.Dio>()));
    gh.singleton<_i15.ApiServices>(() => _i15.ApiServices(gh<_i6.Dio>()));
    gh.factory<_i3.AuthOnlineDataSource>(
        () => _i16.AuthOnlineDataSourceImpl(gh<_i15.ApiServices>()));
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
        () => _i26.OnlineDataSourceImpl(gh<_i14.ApiServices>()));
    gh.factory<_i27.RegistrationViewModel>(
        () => _i27.RegistrationViewModel(gh<_i17.AuthRepository>()));
    gh.factory<_i28.UpdatePasswordUseCase>(
        () => _i28.UpdatePasswordUseCase(gh<_i17.AuthRepository>()));
    gh.factory<_i29.ExamByIdRepo>(() => _i30.ExamByIdRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i31.ExamQuestionsRepo>(() => _i32.ExamQuestionsRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i33.ExamRepo>(() => _i34.ExamRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i35.HomeRepo>(() => _i36.HomeRepoImpl(
          gh<_i25.OnlineDataSource>(),
          gh<_i7.OfflineDataSource>(),
        ));
    gh.factory<_i37.LogoutRepo>(
        () => _i38.LogoutRepoImpl(gh<_i25.OnlineDataSource>()));
    gh.factory<_i39.LogoutUseCase>(
        () => _i39.LogoutUseCase(gh<_i37.LogoutRepo>()));
    gh.factory<_i40.ResetPasswordViewModel>(
        () => _i40.ResetPasswordViewModel(gh<_i28.UpdatePasswordUseCase>()));
    gh.factory<_i41.UseCases>(() => _i41.UseCases(
          gh<_i35.HomeRepo>(),
          gh<_i33.ExamRepo>(),
          gh<_i31.ExamQuestionsRepo>(),
          gh<_i29.ExamByIdRepo>(),
        ));
    gh.factory<_i42.ExamStartScreenViewModel>(
        () => _i42.ExamStartScreenViewModel(gh<_i41.UseCases>()));
    gh.factory<_i43.ExamsViewModel>(
        () => _i43.ExamsViewModel(gh<_i41.UseCases>()));
    gh.factory<_i44.HomeViewModel>(
        () => _i44.HomeViewModel(gh<_i41.UseCases>()));
    gh.factory<_i45.ResultScreenViewModel>(
        () => _i45.ResultScreenViewModel(gh<_i41.UseCases>()));
    gh.singleton<_i46.ActionHandler>(() => _i46.ActionHandler(
          gh<_i41.UseCases>(),
          gh<_i44.HomeViewModel>(),
        ));
    gh.singleton<_i47.ExamsScreenActionHandler>(
        () => _i47.ExamsScreenActionHandler(
              gh<_i43.ExamsViewModel>(),
              gh<_i41.UseCases>(),
            ));
    return this;
  }
}

class _$DioProvider extends _i48.DioProvider {}
