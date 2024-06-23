// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:magenta/core/di/di_container.dart' as _i9;
import 'package:magenta/core/network/client/client.dart' as _i6;
import 'package:magenta/core/repositories/local_storage.dart' as _i8;
import 'package:magenta/core/repositories/token_repository.dart' as _i7;
import 'package:magenta/services/router/router.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.singletonAsync<_i3.GoogleSignIn>(
      () => appModule.googleSignIn,
      preResolve: true,
    );
    gh.singletonAsync<_i4.SharedPreferences>(() => appModule.sharedPreferences);
    gh.singleton<_i5.AppRouter>(() => appModule.router);
    gh.lazySingleton<_i6.Client>(() => appModule.client);
    gh.factory<_i7.TokenRepository>(() => _i7.TokenRepositoryImp());
    gh.singletonAsync<_i8.LocalStorage>(
        () async => _i8.LocalStorage(await getAsync<_i4.SharedPreferences>()));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
