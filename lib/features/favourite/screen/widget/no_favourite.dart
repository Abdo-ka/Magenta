import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/app.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

class NoFavouriteWidget extends StatelessWidget {
  const NoFavouriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppImage.asset(Assets.icons.brokenHeart),
        15.verticalSpace,
        AppText.body('Favourite is Empty', fontWeight: FontWeight.bold),
        10.verticalSpace,
        AppText(
          'go and discover the prodauct and get your favourite item',
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        10.verticalSpace,
        ButtonWidget(
          onPressed: () {
            context.router.maybePop();
          },
          backgroundColor: context.colorScheme.primary,
          text: 'MAIN PAGE',
          textStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onPrimary),
          width: 327.w,
          height: 55.h,
        )
      ],
    );
  }
}
