import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/get_coupon/controller/get_coupon_controller.dart';
import 'package:tostinh/presentation/feature/get_coupon/view/widget/get_coupon_store_section/get_coupon_store_view_item_coupon.dart';

import '../get_coupon_view/get_coupon_view_title_header.dart';
import 'get_coupon_store_view_filter.dart';

class GetCouponStoreSection extends StatelessWidget {
  const GetCouponStoreSection({super.key, required this.controller});
  final GetCouponController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.sp,
          ),
          const GetCouponViewTitleHeader(title: "Store Coupon"),
          SizedBox(
            height: 16.sp,
          ),
          GetCouponStoreViewFilter(controller: controller),
          SizedBox(
            height: 16.sp,
          ),
          SizedBox(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>
                  const GetCouponStoreViewItemCoupon(),
              itemCount: 12,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 16.sp),
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
