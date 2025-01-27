// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/core/repositories/token_repository.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(60, 16, 60, 16),
        children: [
          80.verticalSpace,
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        transform: const GradientRotation(pi / 2.8),
                        colors: [
                          context.colorScheme.primary,
                          context.colorScheme.primaryContainer.darken(.2),
                        ],
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'User Data',
                        style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.primary),
                      ),
                      Row(
                        children: [
                          AppImage.asset(Assets.icons.crown),
                          4.horizontalSpace,
                          AppText.labelSmall(
                            'Gold Magenta',
                            color: const Color.fromARGB(251, 255, 191, 0),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              50.verticalSpace,
              // ButtonProfile(
              //   image: Assets.icons.profileIcon,
              //   title: 'My Information',
              //   onTap: () {},
              // ),
              // 35.verticalSpace,
              ButtonProfile(
                image: Assets.icons.schedule,
                title: 'My Orders',
                onTap: () {
                  context.router.push(const CartRoute());
                },
              ),
              35.verticalSpace,
              // ButtonProfile(
              //   image: Assets.icons.location,
              //   title: 'About Magenta',
              //   onTap: () {},
              // ),
              // 35.verticalSpace,
              // ButtonProfile(
              //   image: Assets.icons.chat,
              //   title: 'How To Use',
              //   onTap: () {},
              // ),
              // 35.verticalSpace,
              ButtonProfile(
                image: Assets.icons.changeLanguage,
                title: 'Logout',
                onTap: () {
                  getIt<TokenRepository>().deleteToken();
                  context.router.pushAll([const SplashRoute()]);
                },
              ),
              // 35.verticalSpace,
              // ButtonProfile(
              //   image: Assets.icons.changeSkin,
              //   title: 'Change App Skin',
              //   onTap: () {},
              // ),
              100.verticalSpace,
              AppText.titleSmall(
                'Feel free to tell us anything you want ',
                color: context.colorScheme.primary,
              ),
              20.verticalSpace,
              AppText.titleSmall(
                'all data saved @Magenta.com ',
                color: context.colorScheme.primary,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ButtonProfile extends StatelessWidget {
  const ButtonProfile(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});
  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          AppImage.asset(image),
          20.horizontalSpace,
          AppText(title),
        ],
      ),
    );
  }
}
