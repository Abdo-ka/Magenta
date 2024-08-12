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
  final String image;
  final String category;
  final String name;
  final String quantity;
  final int price;
  final VoidCallback onTapTrash;
  const CartWidget({
    super.key,
    required this.image,
    required this.category,
    required this.name,
    required this.quantity,
    required this.price,
    required this.onTapTrash,
  });

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
                    AppImage.network(
                      image,
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
                          name,
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
                  price: int.parse(quantity),
                  title: 'paces',
                  color: context.colorScheme.shadow,
                  textStyle: context.textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                LayoutTextBuy(
                  price: price,
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
                    GestureDetector(
                      onTap: onTapTrash,
                      child: AppImage.asset(
                        Assets.icons.trash,
                        size: 25,
                      ),
                    ),
                    Row(
                      children: [
                        AppText(
                          '\$${price + 100}',
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
