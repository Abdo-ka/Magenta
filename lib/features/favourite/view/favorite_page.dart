// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/features/home/screen/widget/item_card_widget.dart';

// 🌎 Project imports:



@RoutePage()
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'My Favourite',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppText(
            'this is the list of your imgainaiation choices:',
            style: context.textTheme.labelSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          // GridView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: context.width / context.height / .75),
          //   itemBuilder: (context, index) => const ItemCardWidget(),
          //   itemCount: 10,
          // ),
          60.verticalSpace,
        ],
      ),
    );
  }
}
