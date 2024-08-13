// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/core/utils/toaster.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

// 🌎 Project imports:


@RoutePage()
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final ValueNotifier<int> isActive = ValueNotifier(0);
  DateTime? lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const backPressThreshold = Duration(seconds: 2);

        if (isActive.value != 0) {
          isActive.value = 0;
          context.router.replaceAll([
            const BaseRoute(children: [HomeRoute()])
          ]);
          return false;
        } else if (lastBackPressTime == null ||
            now.difference(lastBackPressTime!) > backPressThreshold) {
          lastBackPressTime = now;
          Toaster.showDefault('Press back again to exit');
          return false;
        } else {
          return true;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: isActive,
        builder: (BuildContext context, value, Widget? child) =>
            AutoTabsScaffold(
          resizeToAvoidBottomInset: false,
          routes:  [
            HomeRoute(),
            FavoriteRoute(),
            NotificationRoute(),
            ProfileRoute(),
          ],
          floatingActionButtonBuilder: (context, tabsRouter) {
            return Container(
              width: 350.w,
              height: 55.h,
              decoration: BoxDecoration(
                color: context.colorScheme.shadow,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  _items.length,
                  (index) => GestureDetector(
                    onTap: () {
                      isActive.value = index;
                      tabsRouter.setActiveIndex(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage.asset(
                          _items[index].iconPath,
                          height: 20.h,
                          width: 20.w,
                          color: isActive.value == index
                              ? context.colorScheme.primary
                              : null,
                        ),
                        5.verticalSpace,
                        AppText.labelSmall(
                          _items[index].label ?? '',
                          color: isActive.value == index
                              ? context.colorScheme.primary
                              : context.colorScheme.onPrimary,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  final List<Item> _items = [
    Item(iconPath: Assets.icons.home, label: 'HOME'),
    Item(iconPath: Assets.icons.favourite, label: 'FAVOURITE'),
    Item(iconPath: Assets.icons.notification, label: 'NOTIFICATION'),
    Item(iconPath: Assets.icons.profile, label: 'ME'),
  ];
}

class Item {
  final String iconPath;
  final String? label;

  Item({required this.iconPath, this.label});
}
