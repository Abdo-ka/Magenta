// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

// 🌎 Project imports:
import 'package:magenta/gen/assets.gen.dart';

class DetailsPageLoading extends StatelessWidget {
  const DetailsPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[200]!,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          20.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                AppText('Loading Data '),
                15.verticalSpace,
                Row(
                  children: [
                    AppText.bodyLarge(
                      'Loading Data',
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    5.horizontalSpace,
                    AppText.bodySmall(
                      'by: Loading Data',
                      fontWeight: FontWeight.bold,
                      textScaleFactor: 0.6,
                    )
                  ],
                ),
                AppText(
                  'Save Now: \$ Price',
                  style: context.textTheme.titleMedium
                      ?.copyWith(fontFamily: 'Praise'),
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.headlineSmall(
                      '\$Price',
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
          )
        ],
      ),
    );
  }
}
