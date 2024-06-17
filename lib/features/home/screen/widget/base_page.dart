// 🐦 Flutter imports:

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

@RoutePage()
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final ValueNotifier<int> isActive = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isActive,
      builder: (BuildContext context, value, Widget? child) => AutoTabsScaffold(
        resizeToAvoidBottomInset: false,
        routes: const [
          HomeRoute(),
          FavoriteRoute(),
          NotificationRoute(),
          ProfileRoute(),
        ],
        floatingActionButtonBuilder: (context, tabsRouter) => Container(
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
