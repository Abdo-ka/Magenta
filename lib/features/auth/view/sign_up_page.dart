// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/common/environment_variables.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/theme.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/app/components_overrides/app_text_field.dart';
import 'package:magenta/features/app/components_overrides/button_widget.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/drawing/draw_line.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ValueNotifier isHidden = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          30.verticalSpace,
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: context.colorScheme.primary,
                  size: 18,
                ),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          Column(
            children: [
              AppImage.asset(EnvironmentVariables.flavor == Flavor.Dev
                      ? Assets.icons.logoDev
                      : EnvironmentVariables.flavor == Flavor.Stag
                          ? Assets.icons.logoStage
                          : Assets.icons.logo,),
              10.verticalSpace,
              AppText.headlineMedium(
                'Welcome !',
                style: context.textTheme.headlineMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          26.verticalSpace,
          AppTextFormField(
            name: 'email',
            hintText: 'Enter your email address',
            textAlign: TextAlign.left,
            suffixIcon: AppImage.asset(Assets.icons.mail),
          ),
          26.verticalSpace,
          AppTextFormField(
            name: 'name',
            hintText: 'Enter your username',
            textAlign: TextAlign.left,
            suffixIcon: AppImage.asset(Assets.icons.user),
          ),
          26.verticalSpace,
          AppTextFormField(
            name: 'phone',
            hintText: 'Enter your phone number',
            textAlign: TextAlign.left,
            suffixIcon: AppImage.asset(Assets.icons.phone),
          ),
          ValueListenableBuilder(
            valueListenable: isHidden,
            builder: (BuildContext context, value, Widget? child) => Column(
              children: [
                26.verticalSpace,
                AppTextFormField(
                  name: 'password',
                  hintText: 'Enter your Password',
                  textAlign: TextAlign.left,
                  obscureText: isHidden.value,
                  suffixIcon: AppImage.asset(Assets.icons.lock),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      8.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          isHidden.value = !isHidden.value;
                        },
                        child: Stack(children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: context.colorScheme.primary,
                          ),
                          isHidden.value == false
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Line(),
                                )
                              : const SizedBox.shrink(),
                        ]),
                      ),
                    ],
                  ),
                ),
                26.verticalSpace,
                AppTextFormField(
                  name: 'confirmPassword',
                  hintText: 'Confirm your Password',
                  textAlign: TextAlign.left,
                  obscureText: isHidden.value,
                  suffixIcon: AppImage.asset(Assets.icons.lock),
                ),
              ],
            ),
          ),
          26.verticalSpace,
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
                context.router.push(const VerifyNumberRoute());
              },
              backgroundColor: context.colorScheme.primary,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(color: context.colorScheme.onPrimary),
              text: 'Sign Up',
            ),
          ),
          26.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText('If you have an account '),
              GestureDetector(
                onTap: () {
                  context.router.maybePop();
                },
                child: AppText(
                  'Sign In here!',
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          30.verticalSpace,
          AppImage.asset(Assets.icons.rose),
        ],
      ),
    );
  }
}
