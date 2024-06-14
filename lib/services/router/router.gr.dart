// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/cupertino.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:magenta/features/auth/view/reset_password_page.dart' as _i8;
import 'package:magenta/features/auth/view/sign_in_page.dart' as _i9;
import 'package:magenta/features/auth/view/sign_up_page.dart' as _i10;
import 'package:magenta/features/auth/view/verify_number_page.dart' as _i12;
import 'package:magenta/features/favourite/screen/view/favorite_page.dart'
    as _i3;
import 'package:magenta/features/home/screen/view/details_item_page.dart'
    as _i2;
import 'package:magenta/features/home/screen/view/home_page.dart' as _i4;
import 'package:magenta/features/home/screen/widget/base_page.dart' as _i1;
import 'package:magenta/features/intro/view/intro_page.dart' as _i5;
import 'package:magenta/features/notification/screen/view/notification_page.dart'
    as _i6;
import 'package:magenta/features/profile/screen/view/profile_page.dart' as _i7;
import 'package:magenta/features/splash/splash_page.dart' as _i11;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    BaseRoute.name: (routeData) {
      final args =
          routeData.argsAs<BaseRouteArgs>(orElse: () => const BaseRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BasePage(key: args.key),
      );
    },
    DetailsItemRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsItemRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailsItemPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavoritePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    IntroRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.IntroPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NotificationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ResetPasswordPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashPage(),
      );
    },
    VerifyNumberRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.VerifyNumberPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BasePage]
class BaseRoute extends _i13.PageRouteInfo<BaseRouteArgs> {
  BaseRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          BaseRoute.name,
          args: BaseRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i13.PageInfo<BaseRouteArgs> page =
      _i13.PageInfo<BaseRouteArgs>(name);
}

class BaseRouteArgs {
  const BaseRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'BaseRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DetailsItemPage]
class DetailsItemRoute extends _i13.PageRouteInfo<DetailsItemRouteArgs> {
  DetailsItemRoute({
    _i15.Key? key,
    required int id,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          DetailsItemRoute.name,
          args: DetailsItemRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsItemRoute';

  static const _i13.PageInfo<DetailsItemRouteArgs> page =
      _i13.PageInfo<DetailsItemRouteArgs>(name);
}

class DetailsItemRouteArgs {
  const DetailsItemRouteArgs({
    this.key,
    required this.id,
  });

  final _i15.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailsItemRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.FavoritePage]
class FavoriteRoute extends _i13.PageRouteInfo<void> {
  const FavoriteRoute({List<_i13.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.IntroPage]
class IntroRoute extends _i13.PageRouteInfo<void> {
  const IntroRoute({List<_i13.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NotificationPage]
class NotificationRoute extends _i13.PageRouteInfo<void> {
  const NotificationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i13.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<void> {
  const SignInRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.VerifyNumberPage]
class VerifyNumberRoute extends _i13.PageRouteInfo<void> {
  const VerifyNumberRoute({List<_i13.PageRouteInfo>? children})
      : super(
          VerifyNumberRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyNumberRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
