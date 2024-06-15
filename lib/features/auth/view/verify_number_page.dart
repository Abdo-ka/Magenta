// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/theme.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_bar_widget.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/app/components_overrides/button_widget.dart';
import 'package:magenta/features/auth/widget/verification_field.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class VerifyNumberPage extends StatefulWidget {
  const VerifyNumberPage({super.key});

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppText.headlineMedium('Verify Number'),
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          80.verticalSpace,
          Center(
            child: Column(
              children: [
                50.verticalSpace,
                AppText.headlineMedium('Verify your number'),
                30.verticalSpace,
                AppText(
                  'Enter your OTP code below:',
                  color: context.colorScheme.secondaryText,
                ),
                16.verticalSpace,
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: VerificationField(otpController: otpController),
                ),
              ],
            ),
          ),
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
              onPressed: () {
                context.router.replaceAll([BaseRoute()]);
              },
              backgroundColor: context.colorScheme.primary,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(color: context.colorScheme.onPrimary),
              text: 'Verify Account',
            ),
          ),
          35.verticalSpace,
          Column(
            children: [
              AppText('didn\'t receive the code ?'),
              8.verticalSpace,
              AppText(
                'Resend a new code',
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
