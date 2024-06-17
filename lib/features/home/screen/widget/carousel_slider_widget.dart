import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/extension/extensions.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> image;
  CarouselSliderWidget({super.key, required this.image});

  ValueNotifier index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (BuildContext context, value, Widget? child) => Stack(
        children: [
          CarouselSlider.builder(
            itemCount: image.length,
            itemBuilder: (BuildContext context, int index, int realIndex) =>
                Container(
              width: 335.w,
              height: 140.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: AppImage.asset(
                image[index],
                fit: BoxFit.fill,
              ),
            ),
            options: CarouselOptions(
              height: 190.h,
              viewportFraction: .9,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (value, reason) => index.value = value,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                activeIndex: index.value,
                count: image.length,
                effect: WormEffect(
                  activeDotColor: context.colorScheme.primary,
                  type: WormType.thinUnderground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
