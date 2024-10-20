// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/exam/data/repositories/home_repo_impl.dart' as _i815;
import '../../feature/exam/domain/repositories/home_repo.dart' as _i387;
import '../../feature/exam/domain/use_cases/home_usecase.dart' as _i341;

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
    gh.factory<_i387.HomeRepo>(() => _i815.HomeRepoImpl());
    gh.factory<_i341.HomeUseCase>(
        () => _i341.HomeUseCase(gh<_i387.HomeRepo>()));
    return this;
  }
}
