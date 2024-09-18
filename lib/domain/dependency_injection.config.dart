// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker/data/local/preferences.dart' as _i688;
import 'package:habit_tracker/domain/repository/auth_repository.dart' as _i902;
import 'package:habit_tracker/domain/repository/local_database_repository.dart'
    as _i1068;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.lazySingleton<_i688.LocalPreferences>(() => _i688.LocalPreferences());
    gh.lazySingleton<_i1068.LocalDatabaseRepository>(
        () => _i1068.LocalDatabaseRepository());
    gh.lazySingleton<_i902.AuthRepository>(() => _i902.AuthRepository());
    return this;
  }
}
