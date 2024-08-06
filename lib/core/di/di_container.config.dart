// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// 📦 Package imports:
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

// 🌎 Project imports:
import 'package:magenta/core/di/di_container.dart' as _i13;
import 'package:magenta/core/network/client/client.dart' as _i6;
import 'package:magenta/core/repositories/local_storage.dart' as _i12;
import 'package:magenta/core/repositories/token_repository.dart' as _i8;
import 'package:magenta/services/router/router.dart' as _i5;

import 'package:magenta/features/auth/controller/sign_in_cubit/cubit/sign_in_cubit.dart'
    as _i10;
import 'package:magenta/features/auth/controller/sign_up_cubit/cubit/sign_up_cubit.dart'
    as _i9;
import 'package:magenta/features/auth/controller/verification_cubit/cubit/verification_cubit.dart'
    as _i11;
import 'package:magenta/features/auth/data/repositories/auth_repositories.dart'
    as _i7;

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
    gh.factory<_i7.AuthRepositories>(
        () => _i7.AuthRepositories(gh<_i6.Client>()));
    gh.factory<_i8.TokenRepository>(() => _i8.TokenRepositoryImp());
    gh.factory<_i9.SignUpCubit>(
        () => _i9.SignUpCubit(gh<_i7.AuthRepositories>()));
    gh.factory<_i10.SignInCubit>(
        () => _i10.SignInCubit(gh<_i7.AuthRepositories>()));
    gh.factory<_i11.VerificationCubit>(
        () => _i11.VerificationCubit(gh<_i7.AuthRepositories>()));
    gh.singletonAsync<_i12.LocalStorage>(
        () async => _i12.LocalStorage(await getAsync<_i4.SharedPreferences>()));
    return this;
  }
}

class _$AppModule extends _i13.AppModule {}
