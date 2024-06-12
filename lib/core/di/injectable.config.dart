// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:counter_app/data/datasource/local/shared_preferences/counter_shared_prefs.dart'
    as _i3;
import 'package:counter_app/data/repositories_implementation/counter_repo_impl.dart'
    as _i5;
import 'package:counter_app/domain/repositories_contracts/counter_repository.dart'
    as _i4;
import 'package:counter_app/domain/usecases/counter_usecase.dart' as _i6;
import 'package:counter_app/presentation/pages/counter/bloc/counter_bloc.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.singleton<_i3.CounterSharedPrefs>(() => _i3.CounterSharedPrefs());
    gh.singleton<_i4.CounterRepository>(
        () => _i5.CounterRepoImpl(gh<_i3.CounterSharedPrefs>()));
    gh.factory<_i6.CounterUsecase>(
        () => _i6.CounterUsecase(gh<_i4.CounterRepository>()));
    gh.factory<_i7.CounterBloc>(
        () => _i7.CounterBloc(gh<_i6.CounterUsecase>()));
    return this;
  }
}
