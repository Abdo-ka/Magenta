// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

// 🌎 Project imports:


class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(Assets.lottie.done, repeat: false),
                30.verticalSpace,
                AppText(
                  'Payment Successful',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                12.verticalSpace,
                AppText.titleSmall(
                  'go back to main page and restart your shopping experience ',
                  maxLines: 2,
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                50.verticalSpace,
                ButtonWidget(
                  onPressed: () {
                    context.router.replaceAll([const BaseRoute()]);
                  },
                  width: context.width,
                  height: 55.h,
                  text: 'MAIN PAGE',
                  backgroundColor: context.colorScheme.primary,
                  textStyle: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onPrimary),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
