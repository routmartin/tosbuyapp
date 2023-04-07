import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../component/view/custom_cached_image.dart';

class HomeSliderViewImages extends StatelessWidget {
  final Function(int index) onPageChanged;
  final int imageSliderIndex;
  const HomeSliderViewImages({
    super.key,
    required this.onPageChanged,
    required this.imageSliderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      options: CarouselOptions(
        enlargeCenterPage: true,
        aspectRatio: 19/9,
        scrollPhysics: const BouncingScrollPhysics(),
        viewportFraction: 1.0,
        reverse: false,
        padEnds: false,
        autoPlay: true,
        enableInfiniteScroll: false,
        initialPage: imageSliderIndex,
        onPageChanged: (index, reason) {
          onPageChanged.call(index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: GestureDetector(
            onTap: () {},
            child: CustomCachedImage(
              imageUrl: "https://picsum.photos/id/$index/1920/1080",
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        );
      },
    );
  }
}
