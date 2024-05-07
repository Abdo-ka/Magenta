// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart' as _i9;

// 📦 Package imports:
import 'package:auto_route/auto_route.dart' as _i8;

// 🌎 Project imports:
import 'package:magenta/features/auth/view/reset_password_page.dart' as _i3;
import 'package:magenta/features/auth/view/sign_in_page.dart' as _i4;
import 'package:magenta/features/auth/view/sign_up_page.dart' as _i5;
import 'package:magenta/features/auth/view/verify_number_page.dart' as _i7;
import 'package:magenta/features/home/view/home_page.dart' as _i1;
import 'package:magenta/features/intro/view/intro_page.dart' as _i2;
import 'package:magenta/features/splash/splash_page.dart' as _i6;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    IntroRoute.name: (routeData) {
      final args = routeData.argsAs<IntroRouteArgs>(
          orElse: () => const IntroRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.IntroPage(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ResetPasswordPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashPage(),
      );
    },
    VerifyNumberRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.VerifyNumberPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IntroPage]
class IntroRoute extends _i8.PageRouteInfo<IntroRouteArgs> {
  IntroRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          IntroRoute.name,
          args: IntroRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i8.PageInfo<IntroRouteArgs> page =
      _i8.PageInfo<IntroRouteArgs>(name);
}

class IntroRouteArgs {
  const IntroRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'IntroRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ResetPasswordPage]
class ResetPasswordRoute extends _i8.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.VerifyNumberPage]
class VerifyNumberRoute extends _i8.PageRouteInfo<void> {
  const VerifyNumberRoute({List<_i8.PageRouteInfo>? children})
      : super(
          VerifyNumberRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyNumberRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
