// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ValueNotifier isHidden = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          100.verticalSpace,
          AppImage.asset(
            Assets.icons.logo,
          ),
          8.verticalSpace,
          AppText.headlineMedium(
            'Welcome Back !',
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          120.verticalSpace,
          AppTextFormField(
            name: 'Email',
            hintText: 'Enter your email address',
            textAlign: TextAlign.end,
            suffixIcon: AppImage.asset(Assets.icons.mail),
          ),
          26.verticalSpace,
          ListenableBuilder(
            listenable: isHidden,
            builder: (BuildContext context, Widget? child) => AppTextFormField(
              name: 'password',
              hintText: 'Enter your Password',
              textAlign: TextAlign.end,
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
              obscureText: isHidden.value,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  AppText('Rememebr me'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const ResetPasswordRoute());
                },
                child: AppText('Forgot Password ?'),
              ),
            ],
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
              text: 'Log In',
            ),
          ),
          26.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText('If you don\'t have an account '),
              GestureDetector(
                onTap: () {
                  context.router.push(const SignUpRoute());
                },
                child: AppText(
                  'Sign up here!',
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
