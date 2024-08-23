// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pomotracker/app/presentation/app/app.vm.dart' as _i161;
import 'package:pomotracker/app/presentation/root/root_page.vm.dart' as _i670;
import 'package:pomotracker/core/di/app_module.dart' as _i399;
import 'package:pomotracker/core/local_data_source/local_data_source.dart'
    as _i730;

const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i792.GetStorage>(
      () => appModule.storage,
      registerFor: {
        _prod,
        _dev,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i730.LocalDataSource>(
      () => _i730.LocalDataSourceImpl(gh<_i792.GetStorage>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i670.RootViewModel>(() => _i670.RootViewModel());
    gh.singleton<_i161.AppViewModel>(
        () => _i161.AppViewModel(gh<_i730.LocalDataSource>()));
    return this;
  }
}

class _$AppModule extends _i399.AppModule {}
