// // 📦 Package imports:
// import 'package:auto_route/auto_route.dart';

// // 🌎 Project imports:
// import 'package:car/services/router/router.gr.dart';

// @AutoRouterConfig(replaceInRouteName: 'Page,Route')
// class AppRouter extends $AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(page: SplashRoute.page, initial: true),
//         AutoRoute(page: IntroRoute.page),
//         AutoRoute(page: SignInRoute.page),
//         AutoRoute(page: SelectTypeAccountRoute.page),
//         AutoRoute(page: SignUpUserRoute.page),
//         AutoRoute(page: OtpVerificationRoute.page),
//         AutoRoute(page: CompanyRegistrationRoute.page),
//         AutoRoute(page: PickAddressRoute.page),
//         AutoRoute(page: ScheduleRoute.page),
//         AutoRoute(page: TermsAndConditionsRoute.page),
//         AutoRoute(page: SearchRoute.page),
//         AutoRoute(page: FilterRoute.page),
//         AutoRoute(page: ChooseFactoryRoute.page),
//         AutoRoute(
//           page: BaseRoute.page,
//           children: [
//             AutoRoute(page: HomeRoute.page),
//             AutoRoute(page: CarParkRoute.page),
//             AutoRoute(page: ChatsRoute.page),
//             AutoRoute(page: CompaniesRoute.page),
//           ],
//         ),
//         AutoRoute(page: CarsByFactoryRoute.page),
//         AutoRoute(page: NotificationsRoute.page),
//         AutoRoute(page: WatcherRoute.page),
//         AutoRoute(page: AddWatcherRoute.page),
//         AutoRoute(
//           page: ChatWrapper.page,
//           children: [
//             // AutoRoute(page: ChatInfoRoute.page),
//             AutoRoute(page: CarDetailsRoute.page),
//           ],
//         ),
//         AutoRoute(page: CarFaxRoute.page),
//         AutoRoute(page: AboutAppRoute.page),
//         AutoRoute(page: MySubscriptionsRoute.page),
//         AutoRoute(page: SettingRoute.page),
//         AutoRoute(page: TermsAndConditionRoute.page),
//         AutoRoute(page: PrivacyTermsRoute.page),
//         AutoRoute(page: TechnicalSupportRoute.page),
//         AutoRoute(page: ContactWithUsRoute.page),
//         AutoRoute(page: MyAccountRoute.page),
//         AutoRoute(page: MyAdsRoute.page),
//         AutoRoute(page: CompanyDetailsRoute.page),
//         AutoRoute(page: PrivacyTermsRoute.page),
//         CustomRoute(page: DrawerRoute.page, transitionsBuilder: TransitionsBuilders.slideLeft),
//         AutoRoute(
//           page: AddCarWrapper.page,
//           children: [
//             CustomRoute(page: AddCarFirstRoute.page, transitionsBuilder: TransitionsBuilders.slideLeft),
//             CustomRoute(page: AddCarSecondRoute.page, transitionsBuilder: TransitionsBuilders.slideLeft),
//             CustomRoute(page: AddCarThirdRoute.page, transitionsBuilder: TransitionsBuilders.slideLeft),
//             CustomRoute(page: AddCarFourthRoute.page, transitionsBuilder: TransitionsBuilders.slideLeft),
//           ],
//         )
//       ];
// }
