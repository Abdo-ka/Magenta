// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/theme.dart';
import 'package:magenta/gen/assets.gen.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppText.headlineMedium('Password Recovery'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
              child: Column(
            children: [
              180.verticalSpace,
              AppText.headlineMedium('Forgot Password'),
              AppText.titleMedium(
                'Enter your email address to get the linkand end recovery your accaount',
                textAlign: TextAlign.center,
              ),
              16.verticalSpace,
              AppTextFormField(
                name: 'Email',
                hintText: 'Enter your email address',
                textAlign: TextAlign.end,
                suffixIcon: AppImage.asset(Assets.icons.mail),
              ),
            ],
          )),
          16.verticalSpace,
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.lighten(0.4),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 3),
              )
            ]),
            child: ButtonWidget(
              height: 50.h,
              radius: 32,
              onPressed: () {},
              backgroundColor: context.colorScheme.primary,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(color: context.colorScheme.onPrimary),
              text: 'send Link',
            ),
          ),
        ],
      ),
    );
  }
}
