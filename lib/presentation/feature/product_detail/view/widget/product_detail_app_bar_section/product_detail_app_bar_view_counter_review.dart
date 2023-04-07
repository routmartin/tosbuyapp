import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/product_detail/controller/product_detail_controller.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';

class ProductDetailAppBarViewCounterReview extends StatelessWidget {
  final ProductDetailController controller;
  const ProductDetailAppBarViewCounterReview(
      {Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15.sp,
          color: AppColors.pink,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.0.sp,
            vertical: 3.5.sp,
          ),
          child: VerticalDivider(
            thickness: 0.5.sp,
            width: 1,
            color: kSecondaryContainerBlackGray(
              context: context,
            ),
          ),
        ),
        Text(
          "${controller.productData.totalRating}",
          style: kTextDescriptionBold(context: context),
        ),
        SizedBox(width: 6.sp),
        Text(
          "(${controller.productData.totalReview} ${AppLocals.reviews.tr})",
          style: kTextDescriptionBold(context: context)?.copyWith(
            color: kSecondaryContainerBlackGray(
              context: context,
            ),
          ),
        ),
      ],
    );
  }
}
