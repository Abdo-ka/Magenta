// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:magenta/core/di/di_container.dart' as _i363;
import 'package:magenta/core/network/client/client.dart' as _i700;
import 'package:magenta/core/repositories/local_storage.dart' as _i532;
import 'package:magenta/core/repositories/token_repository.dart' as _i192;
import 'package:magenta/features/auth/controller/sign_in_cubit/cubit/sign_in_cubit.dart'
    as _i938;
import 'package:magenta/features/auth/controller/sign_up_cubit/cubit/sign_up_cubit.dart'
    as _i280;
import 'package:magenta/features/auth/controller/verification_cubit/cubit/verification_cubit.dart'
    as _i749;
import 'package:magenta/features/auth/data/repositories/auth_repositories.dart'
    as _i959;
import 'package:magenta/features/favourite/controller/favorite_bloc/favorite_bloc.dart'
    as _i953;
import 'package:magenta/features/favourite/data/repositories/favourite_repositories.dart'
    as _i393;
import 'package:magenta/features/home/controller/cart_cubit/cubit/cart_cubit.dart'
    as _i505;
import 'package:magenta/features/home/controller/home_bloc/home_bloc.dart'
    as _i153;
import 'package:magenta/features/home/data/repositories/cart_repositories.dart'
    as _i375;
import 'package:magenta/features/home/data/repositories/home_repositories.dart'
    as _i491;
import 'package:magenta/features/notification/controller/cubit/notification_cubit.dart'
    as _i629;
import 'package:magenta/features/notification/repositories/notification_repositories.dart'
    as _i380;
import 'package:magenta/services/router/router.dart' as _i925;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    await gh.singletonAsync<_i116.GoogleSignIn>(
      () => appModule.googleSignIn,
      preResolve: true,
    );
    gh.singletonAsync<_i460.SharedPreferences>(
        () => appModule.sharedPreferences);
    gh.singleton<_i925.AppRouter>(() => appModule.router);
    gh.lazySingleton<_i700.Client>(() => appModule.client);
    gh.factory<_i959.AuthRepositories>(
        () => _i959.AuthRepositories(gh<_i700.Client>()));
    gh.factory<_i393.FavouriteRepositories>(
        () => _i393.FavouriteRepositories(gh<_i700.Client>()));
    gh.factory<_i491.HomeRepositories>(
        () => _i491.HomeRepositories(gh<_i700.Client>()));
    gh.factory<_i375.CartRepositories>(
        () => _i375.CartRepositories(gh<_i700.Client>()));
    gh.factory<_i380.NotificationRepositories>(
        () => _i380.NotificationRepositories(gh<_i700.Client>()));
    gh.factory<_i192.TokenRepository>(() => _i192.TokenRepositoryImp());
    gh.factory<_i938.SignInCubit>(
        () => _i938.SignInCubit(gh<_i959.AuthRepositories>()));
    gh.factory<_i280.SignUpCubit>(
        () => _i280.SignUpCubit(gh<_i959.AuthRepositories>()));
    gh.factory<_i749.VerificationCubit>(
        () => _i749.VerificationCubit(gh<_i959.AuthRepositories>()));
    gh.singleton<_i505.CartCubit>(
        () => _i505.CartCubit(gh<_i375.CartRepositories>()));
    gh.factory<_i629.NotificationCubit>(
        () => _i629.NotificationCubit(gh<_i380.NotificationRepositories>()));
    gh.singletonAsync<_i532.LocalStorage>(() async =>
        _i532.LocalStorage(await getAsync<_i460.SharedPreferences>()));
    gh.factory<_i953.FavoriteBloc>(
        () => _i953.FavoriteBloc(gh<_i393.FavouriteRepositories>()));
    gh.singleton<_i153.HomeBloc>(() => _i153.HomeBloc(
          gh<_i491.HomeRepositories>(),
          gh<_i393.FavouriteRepositories>(),
        ));
    return this;
  }
}

class _$AppModule extends _i363.AppModule {}
