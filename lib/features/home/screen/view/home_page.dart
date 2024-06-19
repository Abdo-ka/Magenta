// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/extension/extensions.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/app/components_overrides/app_text_field.dart';
import 'package:magenta/features/app/components_overrides/icon_button_widget.dart';
import 'package:magenta/features/home/screen/widget/carousel_slider_widget.dart';
import 'package:magenta/features/home/screen/widget/category_item.dart';
import 'package:magenta/features/home/screen/widget/item_card_widget.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonWidget(
                onPressed: () {},
                buttonColor: Colors.transparent,
                child: AppImage.asset(Assets.icons.drawer),
              ),
              AppImage.asset(
                Assets.icons.logo,
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
          AppTextFormField(
            hintText: 'search for imagination',
            hintTextDirection: TextDirection.ltr,
            suffixIcon: AppImage.asset(Assets.icons.search),
          ),
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
                  text: 'Fancy',
                ),
                CategoryItem(
                  imagePath: Assets.icons.flowerVector,
                  text: 'Fancy1',
                ),
                CategoryItem(
                  imagePath: Assets.icons.flowerVector,
                  text: 'Fancy2',
                ),
                CategoryItem(
                  imagePath: Assets.icons.flowerVector,
                  text: 'Fancy3',
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
          CarouselSliderWidget(image: [
            Assets.icons.introVector,
            Assets.icons.flowerVector,
            Assets.icons.flowerVector,
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
              (index) => const ItemCardWidget(),
            )),
          ),
          100.verticalSpace,
        ],
      ),
    );
  }
}
