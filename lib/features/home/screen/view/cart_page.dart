// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/core/extension/extensions.dart';
import 'package:magenta/features/app/components_overrides/animated_dialog.dart';
import 'package:magenta/features/app/components_overrides/app_bar_widget.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/home/screen/widget/cart_widget.dart';
import 'package:magenta/features/home/screen/widget/payment_success_dialog.dart';
import 'package:magenta/gen/assets.gen.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: context.width,
        height: 76,
        color: context.colorScheme.shadow,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LayoutTextBuy(
                price: 50,
                title: 'Total cart',
              ),
              const LayoutTextBuy(
                price: 80,
                title: 'promo discount',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppText(
                        'TOTAL PRICE: ',
                        color: context.colorScheme.onPrimary,
                      ),
                      AppText(
                        '55.00 \$',
                        color: context.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      AnimatedDialog.show(context,
                          child: const PaymentSuccessDialog());
                    },
                    child: Row(
                      children: [
                        AppText(
                          'next',
                          color: context.colorScheme.primary,
                        ),
                        2.horizontalSpace,
                        AppImage.asset(
                          Assets.icons.arrowRight,
                          color: context.colorScheme.primary,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBarWidget(
        title: AppText(
          'Imagination Cart',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(
          10 + 1,
          (index) => index == 10
              ? 70.verticalSpace
              : const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: CartWidget(),
                ),
        ),
      ),
    );
  }
}

class LayoutTextBuy extends StatelessWidget {
  const LayoutTextBuy(
      {super.key,
      required this.price,
      required this.title,
      this.color,
      this.textStyle});
  final int price;
  final String title;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title,
          style: textStyle,
          color: color ?? context.colorScheme.onPrimary,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              String dots = '.' * (constraints.maxWidth ~/ 3.5);
              return AppText(
                dots,
                style: textStyle,
                color: color ?? context.colorScheme.onPrimary,
                overflow: TextOverflow.clip,
                maxLines: 1,
              );
            },
          ),
        ),
        AppText(
          '\$ $price',
          style: textStyle,
          color: color ?? context.colorScheme.onPrimary,
        ),
      ],
    );
  }
}
