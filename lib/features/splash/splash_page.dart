import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () => context.replaceRoute( IntroRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AppImage.asset(
              Assets.icons.vectorSplash,
              fit: BoxFit.fill,
            )
                .animate()
                .fade(delay: const Duration(milliseconds: 500))
                .slide(begin: const Offset(0, 2)),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppImage.asset(Assets.icons.logo),
                8.verticalSpace,
                AppText.titleMedium(
                  'Imagine your world',
                  color: context.colorScheme.primary,
                )
              ],
            ),
          ).animate().fade(delay: const Duration(milliseconds: 500)).slideY(),
        ],
      ),
    );
  }
}
