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
import 'package:magenta/features/app/components_overrides/button_widget.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final List<String> title = [
    'Get Your Best Shop Experience!',
    'Discover The Fancy Collection!',
    'The Place Of Imagination!',
  ];

  final List<String> body = [
    'with our product there is no chance that you won’t be stylish!',
    'Discover our exquisite collection of fancy items curated just for you!',
    'Dream big and make it a reality with our amazing products!',
  ];
  final PageController controller = PageController(initialPage: 0);
  final ValueNotifier values = ValueNotifier(0);
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
              Assets.icons.introVector,
              fit: BoxFit.fill,
            ),
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
                ),
                60.verticalSpace,
                SizedBox(
                  height: 150.h,
                  child: PageView(
                    onPageChanged: (value) => values.value = value,
                    controller: controller,
                    children: List.generate(
                      3,
                      (index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: AppText(
                              title[index],
                              style: context.textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          16.verticalSpace,
                          SizedBox(
                            width: 308.w,
                            child: AppText(
                              body[index],
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: values,
            builder: (BuildContext context, _, Widget? child) => Positioned(
              bottom: 100,
              right: context.width / 2.75.w,
              child: Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AppImage.asset(
                      Assets.icons.flowerVector,
                      color: values.value >= index
                          ? context.colorScheme.primary
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: values,
            builder: (context, value, child) => values.value == 2
                ? Positioned(
                    bottom: 180,
                    left: context.width / 4.5.w,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.primary.lighten(0.4),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ]),
                      child: ButtonWidget(
                        width: 215.w,
                        height: 50.h,
                        onPressed: () {
                          context.replaceRoute(const SignInRoute());
                        },
                        backgroundColor: context.colorScheme.primary,
                        textStyle: context.textTheme.titleMedium
                            ?.copyWith(color: context.colorScheme.onPrimary),
                        text: 'Start Imagination',
                      ),
                    ))
                : Positioned(
                    bottom: 180,
                    right: context.width / 2.3.w,
                    child: ButtonWidget(
                      width: 70.w,
                      height: 40.h,
                      textStyle: context.textTheme.titleMedium
                          ?.copyWith(color: context.colorScheme.shadow),
                      backgroundColor: context.colorScheme.primary.lighten(0.4),
                      onPressed: () {
                        controller.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      text: 'Skip',
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
