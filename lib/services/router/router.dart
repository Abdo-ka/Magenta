// 📦 Package imports:
import 'package:auto_route/auto_route.dart';

// 🌎 Project imports:
import 'package:magenta/services/router/router.gr.dart';

// 🌎 Project imports:

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: SplashRoute.page),
        CustomRoute(
            page: HomeRoute.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade),
        CustomRoute(
            page: IntroRoute.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade),
        CustomRoute(
            page: SignInRoute.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade),
        CustomRoute(
            page: SignUpRoute.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade),
        CustomRoute(
            page: ResetPasswordRoute.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade),
        CustomRoute(
            page: VerifyNumberRoute.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade),

        CustomRoute(
            page: DetailsItemRoute.page,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade),

        AutoRoute(
           initial: true,
          page: BaseRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: NotificationRoute.page),
            AutoRoute(page: FavoriteRoute.page),
          ],
        ),

        // AutoRoute(
        //   page: ChatWrapper.page,
        //   children: [
        //     // AutoRoute(page: ChatInfoRoute.page),
        //     AutoRoute(page: CarDetailsRoute.page),
        //   ],
        // ),
      ];
}
