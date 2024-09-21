// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:core/core.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> image;
  final bool scroll;
  final bool infinityScroll;
  CarouselSliderWidget({
    super.key,
    required this.image,
    this.scroll = true,
    this.infinityScroll = true,
  });

  ValueNotifier index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (BuildContext context, value, Widget? child) => Stack(
        children: [
          FlutterCarousel.builder(
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
              enableInfiniteScroll: infinityScroll ?? true,
              autoPlay: scroll ?? true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (value, reason) => index.value = value,
              scrollDirection: Axis.horizontal,
            ),
          ),
          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: AnimatedSmoothIndicator(
          //       activeIndex: index.value,
          //       count: image.length,
          //       effect: WormEffect(
          //         activeDotColor: context.colorScheme.primary,
          //         type: WormType.thinUnderground,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
