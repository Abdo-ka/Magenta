// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onPressed});
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: () => onPressed.call(),
          child: Container(
            width: 108.w,
            height: 45.h,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  AppImage.asset(
                    imagePath,
                    size: 20,
                  ),
                  5.horizontalSpace,
                  Expanded(
                    child: AppText(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
