// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/common/environment_variables.dart';
import 'package:magenta/config/theme/theme.dart';
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
              color: context.colorScheme.primary.lighten(.35),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppImage.asset(
                  EnvironmentVariables.flavor == Flavor.Dev
                      ? Assets.icons.logoDev
                      : EnvironmentVariables.flavor == Flavor.Stag
                          ? Assets.icons.logoStage
                          : Assets.icons.logo,
                ),
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
                              style: context.textTheme.titleLarge?.copyWith(
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
                              style: context.textTheme.titleMedium?.copyWith(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 90.h),
              child: ValueListenableBuilder(
                valueListenable: values,
                builder: (BuildContext context, _, Widget? child) => Row(
                  mainAxisSize: MainAxisSize.min,
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
          ),
          ValueListenableBuilder(
            valueListenable: values,
            builder: (context, value, child) => values.value == 2
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 140.h),
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
                          onPressed: () {
                            context.replaceRoute(const SignInRoute());
                          },
                          backgroundColor: context.colorScheme.primary,
                          textStyle: context.textTheme.titleMedium
                              ?.copyWith(color: context.colorScheme.onPrimary),
                          text: 'Start Imagination',
                        ),
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 140.h),
                      child: ButtonWidget(
                        width: 70.w,
                        textStyle: context.textTheme.titleMedium
                            ?.copyWith(color: context.colorScheme.shadow),
                        backgroundColor: context.colorScheme.surface,
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
                  ),
          ),
        ],
      ),
    );
  }
}
