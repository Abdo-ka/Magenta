// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:magenta/features/home/view/home_page.dart' as _i1;
import 'package:magenta/features/intro/view/intro_page.dart' as _i2;
import 'package:magenta/features/splash/splash_page.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    IntroRoute.name: (routeData) {
      final args = routeData.argsAs<IntroRouteArgs>(
          orElse: () => const IntroRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.IntroPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IntroPage]
class IntroRoute extends _i4.PageRouteInfo<IntroRouteArgs> {
  IntroRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          IntroRoute.name,
          args: IntroRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const _i4.PageInfo<IntroRouteArgs> page =
      _i4.PageInfo<IntroRouteArgs>(name);
}

class IntroRouteArgs {
  const IntroRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'IntroRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
