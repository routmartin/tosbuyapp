import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/controller/my_order_review_product_controller.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/view/widget/my_order_review_product_input_review_section/my_order_review_product_input_review_section.dart';
import 'package:tostinh/presentation/feature/my_order_review_product/view/widget/my_order_review_product_rating_section/my_order_review_product_rating_section.dart';
import '../../../../component/view/custom_button_bottom.dart';
import 'my_order_review_product_add_photos_section/my_order_review_product_add_photos_section.dart';

class MyOrderReviewProductBody extends StatelessWidget {
  final MyOrderReviewProductController controller;
  const MyOrderReviewProductBody({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyOrderReviewProductRatingSection(),
          SizedBox(
            height: 16.sp,
          ),
          MyOrderReviewProductInputReviewSection(),
          SizedBox(
            height: 16.sp,
          ),
          MyOrderReviewProductAddPhotosSection(),
          SizedBox(
            height: 16.sp,
          ),
          CustomButtonBottom(
            title: "Send Review",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
