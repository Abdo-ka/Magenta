// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/gen/assets.gen.dart';

@RoutePage()
class DetailsItemPage extends StatelessWidget {
  const DetailsItemPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonWidget(
        width: 204.w,
        height: 50.h,
        radius: 30.r,
        prefixIcon: AppImage.asset(Assets.icons.add),
        spaceBetween: 20,
        backgroundColor: context.colorScheme.shadow,
        foregroundColor: context.colorScheme.onPrimary,
        onPressed: () {},
        text: 'ADD TO CART',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          20.verticalSpace,
          Container(
            width: 335.w,
            height: 670.h,
            decoration: BoxDecoration(
              color: context.colorScheme.gray,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.colorScheme.primary),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.gray.darken(.2),
                  blurRadius: 2,
                  offset: const Offset(0.0, 0.75),
                ),
                BoxShadow(
                  color: context.colorScheme.gray.darken(.2),
                  blurRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonWidget(
                        onPressed: () => context.router.maybePop(),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: context.colorScheme.primary,
                          size: 21,
                        ),
                      ),
                      AppImage.asset(Assets.icons.flowerVector),
                      AppImage.asset(
                        Assets.icons.favourite,
                        color: context.colorScheme.shadow,
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Center(
                    // TODO: also here should add hero
                    child: AppImage.asset(
                      Assets.icons.test.path,
                      fit: BoxFit.fill,
                      width: 250.w,
                      height: 215.h,
                    ),
                  ),
                  15.verticalSpace,
                  AppText.headlineMedium(
                    'SAUVAGE Dior',
                    color: context.colorScheme.primary,
                  ),
                  15.verticalSpace,
                  AppText(
                      'You can plot each fragrance family s popularity percentage over the years, showing trends in consumer preferences. This could be based on market research data, sales figures, or expert opinions on the dominant trends in the perfume industry.'),
                  15.verticalSpace,
                  Row(
                    children: [
                      AppText.bodyLarge(
                        '" Imagine your world "',
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      5.horizontalSpace,
                      AppText.bodySmall(
                        'by: reda HR',
                        fontWeight: FontWeight.bold,
                        textScaleFactor: 0.6,
                      )
                    ],
                  ),
                  AppText(
                    'Save Now: \$52.00',
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontFamily: 'Praise'),
                  ),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.headlineSmall(
                        '\$752.00',
                        fontWeight: FontWeight.bold,
                      ),
                      AppIncrement(
                        initialValue: 0,
                        onChanged: (index) {
                          // print(index);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
