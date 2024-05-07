// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:magenta/services/router/router.gr.dart';

// 🌎 Project imports:


@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: IntroRoute.page),
        // AutoRoute(
        //   page: BaseRoute.page,
        //   children: [
        //     AutoRoute(page: HomeRoute.page),
        //     AutoRoute(page: CarParkRoute.page),
        //     AutoRoute(page: ChatsRoute.page),
        //     AutoRoute(page: CompaniesRoute.page),
        //   ],
        // ),
       
        // AutoRoute(
        //   page: ChatWrapper.page,
        //   children: [
        //     // AutoRoute(page: ChatInfoRoute.page),
        //     AutoRoute(page: CarDetailsRoute.page),
        //   ],
        // ),
      ];
}
