import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_bar_widget.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/gen/assets.gen.dart';

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
                        'Reda Heritany',
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
              ButtonProfile(
                image: Assets.icons.profileIcon,
                title: 'My Information',
                onTap: () {},
              ),
              35.verticalSpace,
              ButtonProfile(
                image: Assets.icons.schedule,
                title: 'My Orders',
                onTap: () {},
              ),
              35.verticalSpace,
              ButtonProfile(
                image: Assets.icons.location,
                title: 'About Magenta',
                onTap: () {},
              ),
              35.verticalSpace,
              ButtonProfile(
                image: Assets.icons.chat,
                title: 'How To Use',
                onTap: () {},
              ),
              35.verticalSpace,
              ButtonProfile(
                image: Assets.icons.changeLanguage,
                title: 'Change Language',
                onTap: () {},
              ),
              35.verticalSpace,
              ButtonProfile(
                image: Assets.icons.changeSkin,
                title: 'Change App Skin',
                onTap: () {},
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
