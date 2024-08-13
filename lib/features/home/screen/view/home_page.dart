// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/common/environment_variables.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/features/home/controller/home_bloc/home_bloc.dart';
import 'package:magenta/features/home/screen/view/home_page_loading.dart';
import 'package:magenta/features/home/screen/widget/carousel_slider_widget.dart';
import 'package:magenta/features/home/screen/widget/category_item.dart';
import 'package:magenta/features/home/screen/widget/item_card_widget.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = getIt<HomeBloc>();
  @override
  void initState() {
    bloc.add(GetFavouriteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.categoryStatus == Status.loading ||
                state.popularStatus == Status.loading) {
              return const HomePageLoading();
            } else {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonWidget(
                        onPressed: () async {
                          context.router.replaceAll([
                            const BaseRoute(children: [ProfileRoute()])
                          ]);
                        },
                        buttonColor: Colors.transparent,
                        child: AppImage.asset(Assets.icons.drawer),
                      ),
                      AppImage.asset(
                        EnvironmentVariables.flavor == Flavor.Dev
                            ? Assets.icons.logoDev
                            : EnvironmentVariables.flavor == Flavor.Stag
                                ? Assets.icons.logoStage
                                : Assets.icons.logo,
                        size: 40,
                      ),
                      IconButtonWidget(
                        onPressed: () {
                          context.router.push(const CartRoute());
                        },
                        buttonColor: Colors.transparent,
                        child: Stack(children: [
                          AppImage.asset(Assets.icons.handBag),
                          Positioned(
                            left: 10,
                            child: Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.colorScheme.error),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  18.verticalSpace,
                  AppText.titleLarge(
                    'Select Category',
                    fontWeight: FontWeight.bold,
                  ),
                  10.verticalSpace,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                      state.category.categories?.data?.length ?? 0,
                      (index) => CategoryItem(
                        imagePath: Assets.icons.flowerVector,
                        text:
                            state.category.categories?.data?[index].name ?? '',
                        onPressed: () {
                          // Scrollable.ensureVisible(FancyKey.currentContext!,
                          //     duration: const Duration(milliseconds: 300),
                          //     curve: Curves.easeIn);
                        },
                      ),
                    )),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Offer',
                            style: context.textTheme.headlineSmall?.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: ' Time',
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ])),
                      // AppText.titleMedium(
                      //   'Get Coupon',
                      //   color: context.colorScheme.primary,
                      // ),
                    ],
                  ),
                  15.verticalSpace,
                  CarouselSliderWidget(image: [
                    Assets.icons.test1.path,
                    Assets.icons.test2.path,
                    Assets.icons.test3.path,
                    Assets.icons.test4.path,
                  ]),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Popular',
                          style: context.textTheme.headlineSmall?.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: ' Ideas',
                            style: context.textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold))
                      ])),
                    ],
                  ),
                  15.verticalSpace,
                  SingleChildScrollView(
                      // key: FancyKey,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          state.products.products?.data?.length ?? 0,
                          (index) => ItemCardWidget(
                            categoryName: state.category.categories!.data!
                                    .firstWhere(
                                      (element) =>
                                          element.id ==
                                          state.products.products?.data?[index]
                                              .categoryId,
                                    )
                                    .name ??
                                '',
                            name: state.products.products?.data?[index].name ??
                                '',
                            price:
                                state.products.products?.data?[index].price ??
                                    '',
                            image: state.products.products?.data?[index]
                                    .media?[0].originalUrl ??
                                '',
                            id: state.products.products!.data![index].id!,
                            onTap: () {
                              state.Favourite.contains(
                                      state.products.products!.data![index].id!)
                                  ? bloc.add(RemoveFavouriteEvent(
                                      id: state
                                          .products.products!.data![index].id!))
                                  : bloc.add(AddFavouriteEvent(
                                      id: state.products.products!.data![index]
                                          .id!));
                            },
                          ),
                        ),
                      )),
                  100.verticalSpace,
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
