
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/button_widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.imagePath, required this.text});
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ButtonWidget(
        onPressed: () {},
        height: 40.h,
        text: text,
        childPadding: const EdgeInsets.all(10),
        prefixIcon: AppImage.asset(imagePath),
      ),
    );
  }
}
