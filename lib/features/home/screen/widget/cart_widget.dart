// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/features/home/screen/view/cart_page.dart';
import 'package:magenta/gen/assets.gen.dart';

// 🌎 Project imports:


class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 210.h,
      decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppImage.asset(
                      Assets.icons.test.path,
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                    10.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppImage.asset(Assets.icons.eLetter),
                            4.horizontalSpace,
                            AppText.labelSmall(
                              'Painting ',
                              color: context.colorScheme.primary,
                            ),
                          ],
                        ),
                        AppText(
                          'SAUVAGE Dior',
                          style: context.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                10.verticalSpace,
                AppText.labelSmall(
                  'Bills:',
                  style: context.textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                LayoutTextBuy(
                  price: 50,
                  title: 'paces',
                  color: context.colorScheme.shadow,
                  textStyle: context.textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                LayoutTextBuy(
                  price: 100,
                  title: 'price',
                  color: context.colorScheme.shadow,
                  textStyle: context.textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                LayoutTextBuy(
                  price: 100,
                  title: 'service',
                  color: context.colorScheme.shadow,
                  textStyle: context.textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppImage.asset(
                          Assets.icons.trash,
                          size: 25,
                        ),
                        10.horizontalSpace,
                        AppCheckbox(
                          onChanged: (value) {},
                          isSelected: true,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AppText(
                          'total price: ',
                          style: context.textTheme.labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        AppText(
                          '\$752.00',
                          style: context.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: AppImage.asset(Assets.icons.flowerVector),
          )
        ],
      ),
    );
  }
}
