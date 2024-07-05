// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/app/components_overrides/icon_button_widget.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          context.router.push(DetailsItemRoute(id: 1));
        },
        child: Container(
          width: width ?? 146.w,
          height: height ?? 256.h,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.primary),
            color: context.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.gray,
                blurRadius: 2,
                offset: const Offset(0.0, 0.75),
              ),
              BoxShadow(
                color: context.colorScheme.gray,
                blurRadius: 2,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO: here should add hero widget
                AppImage.asset(
                  Assets.icons.test.path,
                  fit: BoxFit.fill,
                  width: 146.w,
                  height: 120.h,
                ),
                7.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppImage.asset(
                          Assets.icons.eLetter,
                          size: 14,
                        ),
                        4.horizontalSpace,
                        AppText(
                          'STYLE',
                          style: context.textTheme.labelMedium?.copyWith(
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
                    AppText('\$6500'),
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
    );
  }
}
