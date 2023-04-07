import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/product_detail/view/widget/product_detail_app_bar_section/product_detail_app_bar_view_counter_review.dart';
import 'package:tostinh/presentation/feature/product_detail/view/widget/product_detail_app_bar_section/product_detail_app_bar_view_wishlist.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../controller/product_detail_controller.dart';

class ProductDetailAppBarViewHeadline extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailAppBarViewHeadline({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 16.sp,left: 16.sp,right: 16.sp),
          child: Text(
            controller.productData.name.toString(),
            textAlign: TextAlign.left,
            style: kTextHeadline3(context: context),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDetailAppBarViewCounterReview(controller: controller),
              ProductDetailAppBarViewWishlist(controller: controller),
            ],
          ),
        )
      ],
    );
  }
}
