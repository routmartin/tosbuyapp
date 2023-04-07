import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/view/custom_cached_image.dart';

class ProductDetailReviewViewItemMedia extends StatelessWidget {
  const ProductDetailReviewViewItemMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.sp,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        separatorBuilder: (context, index) {
          return SizedBox(width: 10.sp);
        },
        itemBuilder: (context, index) {
          return SizedBox(
            width: 104.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const CustomCachedImage(
                imageUrl:
                    "https://specials-images.forbesimg.com/imageserve/62b322669e515ab7a37a1f0b/A87B25F0-63B5-4272-B7D7-6265D766C130-1-102-o/960x0.jpg?fit=scale",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
