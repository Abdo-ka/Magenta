import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/extension/extensions.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/app/components_overrides/button_widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.imagePath, required this.text});
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  AppImage.asset(imagePath),
                  5.horizontalSpace,
                  AppText(text)
                ],
              ),
            ),
          ),
        ));
  }
}
