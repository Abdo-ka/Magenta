import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/gen/assets.gen.dart';
import 'package:magenta/services/router/router.gr.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          context.router.push(DetailsItemRoute(id: 1));
        },
        child: Container(
          width: 146.w,
          height: 206.h,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: context.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.gray,
                blurRadius: 2,
                offset: const Offset(0.0, 0.75),
              ),
              BoxShadow(
                color: context.colorScheme.gray,
                blurRadius: 2,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              AppImage.asset(
                Assets.icons.test.path,
                fit: BoxFit.fill,
                width: 140.w, 
                height: 120.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
