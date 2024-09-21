// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:magenta/features/auth/view/reset_password_page.dart' as _i9;
import 'package:magenta/features/auth/view/sign_in_page.dart' as _i10;
import 'package:magenta/features/auth/view/sign_up_page.dart' as _i11;
import 'package:magenta/features/auth/view/verify_number_page.dart' as _i13;
import 'package:magenta/features/favourite/screen/view/favorite_page.dart'
    as _i4;
import 'package:magenta/features/home/screen/view/cart_page.dart' as _i2;
import 'package:magenta/features/home/screen/view/details_item_page.dart'
    as _i3;
import 'package:magenta/features/home/screen/view/home_page.dart' as _i5;
import 'package:magenta/features/home/screen/widget/base_page.dart' as _i1;
import 'package:magenta/features/intro/view/intro_page.dart' as _i6;
import 'package:magenta/features/notification/screen/view/notification_page.dart'
    as _i7;
import 'package:magenta/features/profile/screen/view/profile_page.dart' as _i8;
import 'package:magenta/features/splash/splash_page.dart' as _i12;

/// generated route for
/// [_i1.BasePage]
class BaseRoute extends _i14.PageRouteInfo<void> {
  const BaseRoute({List<_i14.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.BasePage();
    },
  );
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i14.PageRouteInfo<void> {
  const CartRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.CartPage();
    },
  );
}

/// generated route for
/// [_i3.DetailsItemPage]
class DetailsItemRoute extends _i14.PageRouteInfo<DetailsItemRouteArgs> {
  DetailsItemRoute({
    _i15.Key? key,
    required int id,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          DetailsItemRoute.name,
          args: DetailsItemRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsItemRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsItemRouteArgs>();
      return _i3.DetailsItemPage(
        key: args.key,
        id: args.id,
      );
    },
  );
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
/// [_i4.FavoritePage]
class FavoriteRoute extends _i14.PageRouteInfo<void> {
  const FavoriteRoute({List<_i14.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavoritePage();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.IntroPage]
class IntroRoute extends _i14.PageRouteInfo<void> {
  const IntroRoute({List<_i14.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.IntroPage();
    },
  );
}

/// generated route for
/// [_i7.NotificationPage]
class NotificationRoute extends _i14.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          NotificationRoute.name,
          args: NotificationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationRouteArgs>(
          orElse: () => const NotificationRouteArgs());
      return _i7.NotificationPage(key: args.key);
    },
  );
}

class NotificationRouteArgs {
  const NotificationRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfilePage();
    },
  );
}

/// generated route for
/// [_i9.ResetPasswordPage]
class ResetPasswordRoute extends _i14.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.ResetPasswordPage();
    },
  );
}

/// generated route for
/// [_i10.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignInRouteArgs>(orElse: () => const SignInRouteArgs());
      return _i10.SignInPage(key: args.key);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SignUpPage]
class SignUpRoute extends _i14.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SignUpRouteArgs>(orElse: () => const SignUpRouteArgs());
      return _i11.SignUpPage(key: args.key);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashPage();
    },
  );
}

/// generated route for
/// [_i13.VerifyNumberPage]
class VerifyNumberRoute extends _i14.PageRouteInfo<void> {
  const VerifyNumberRoute({List<_i14.PageRouteInfo>? children})
      : super(
          VerifyNumberRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyNumberRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.VerifyNumberPage();
    },
  );
}
