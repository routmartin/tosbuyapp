import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_cached_image.dart';
import '../../../controller/product_detail_controller.dart';

class ProductDetailAppBarViewMediaSlide extends StatefulWidget {
  final ProductDetailController controller;

  const ProductDetailAppBarViewMediaSlide({
    super.key,
    required this.controller,
  });
  @override
  State<StatefulWidget> createState() =>
      _ProductDetailAppBarViewMediaSlideState();
}

class _ProductDetailAppBarViewMediaSlideState
    extends State<ProductDetailAppBarViewMediaSlide> {
  ProductDetailController get controller => widget.controller;

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: controller.images.length,
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: Get.height,
            aspectRatio: 1,
            scrollPhysics: const BouncingScrollPhysics(),
            viewportFraction: 1.0,
            reverse: false,
            padEnds: false,
            enableInfiniteScroll: false,
            initialPage: activeIndex,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) => SizedBox(
            width: Get.width,
            child: CustomCachedImage(
              imageUrl: "${controller.images[index]}",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 13.sp,
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: controller.images.length,
            curve: Curves.easeInOut,
            effect: ExpandingDotsEffect(
              expansionFactor: 4,
              activeDotColor: kOnPrimaryBlack(context: context),
              dotColor: kOnPrimaryContainerBlackGray(context: context),
              dotHeight: 6.0.sp,
              dotWidth: 6.0.sp,
              spacing: 4.0.sp,
            ),
          ),
        ),
      ],
    );
  }
}
