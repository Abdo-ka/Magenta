import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/common/environment_variables.dart';
import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/features/home/screen/widget/carousel_slider_widget.dart';
import 'package:magenta/features/home/screen/widget/category_item.dart';
import 'package:magenta/features/home/screen/widget/item_card_widget.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:shimmer/shimmer.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[200]!,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonWidget(
                onPressed: () async {},
                buttonColor: Colors.transparent,
                child: AppImage.asset(Assets.icons.drawer),
              ),
              AppText.headlineLarge('MAGENTA'),
              IconButtonWidget(
                onPressed: () {},
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
          // AppTextFormField(
          //   hintText: 'search for imagination',
          //   hintTextDirection: TextDirection.ltr,
          //   suffixIcon: AppImage.asset(Assets.icons.search),
          // ),
          15.verticalSpace,
          AppText.titleLarge(
            'Select Category',
            fontWeight: FontWeight.bold,
          ),
          10.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItem(
                  imagePath: Assets.icons.flowerVector,
                  text: 'Fanceey',
                  onPressed: () {},
                ),
                CategoryItem(
                  imagePath: Assets.icons.flowerVector,
                  text: 'Fancy1',
                  onPressed: () {},
                ),
                CategoryItem(
                  imagePath: Assets.icons.flowerVector,
                  text: 'Fancy2',
                  onPressed: () {},
                ),
                CategoryItem(
                  imagePath: Assets.icons.flowerVector,
                  text: 'Fancy3',
                  onPressed: () {},
                ),
              ],
            ),
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
              AppText.titleMedium(
                'Get Coupon',
                color: context.colorScheme.primary,
              ),
            ],
          ),
          15.verticalSpace,
          CarouselSliderWidget(
            image: [
              Assets.icons.flowerVector,
            ],
            scroll: false,
            infinityScroll: false,
          ),
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
              AppText.titleMedium(
                'See all',
                color: context.colorScheme.primary,
              ),
            ],
          ),
          15.verticalSpace,
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 146.w,
                    height: 256.h,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          120.verticalSpace,
                          //TODO: here should add hero widget

                          7.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppText('E'),
                                  4.horizontalSpace,
                                  AppText(
                                    'STYLE',
                                    style:
                                        context.textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.colorScheme.primary,
                                    ),
                                  )
                                ],
                              ),
                              AppImage.asset(
                                Assets.icons.favourite,
                                color: context.colorScheme.shadow,
                                size: 15,
                              )
                            ],
                          ),
                          3.verticalSpace,
                          AppText(
                            'SAUVAGE Dior',
                            style: context.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText('\$price'),
                              IconButtonWidget(
                                widgetDimension: 32,
                                buttonColor: context.colorScheme.primary,
                                onPressed: () {},
                                isCircle: true,
                                child: AppImage.asset(
                                  Assets.icons.add,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
