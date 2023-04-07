import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_styles.dart';
import 'product_detail_review_view_rating_percent_indicator.dart';

class ProductDetailReviewViewRating extends StatelessWidget {
  final double percent;

  const ProductDetailReviewViewRating({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ProductDetailReviewViewRatingPercentIndicator(
            lineHeight: 8.sp,
            animationDuration: 2500,
            percent: percent,
            barRadius: Radius.circular(4.sp),
            progressColor: AppColors.yellow,
            backgroundColor: kPrimaryContainerWhiteGray(context: context),
          ),
        ),
      ],
    );
  }
}
