import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/get_coupon/controller/get_coupon_controller.dart';

import '../get_coupon_view/get_coupon_view_title_header.dart';
import 'get_coupon_company_view_item_coupon.dart';

class GetCouponCompanySection extends StatelessWidget {
  const GetCouponCompanySection({super.key, required this.controller});
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
          const GetCouponViewTitleHeader(title: "IG Coupon"),
          SizedBox(
            height: 16.sp,
          ),
          SizedBox(
            height: 84.sp,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              itemBuilder: (context, index) =>
                  const GetCouponCompanyViewItemCoupon(),
              itemCount: 2,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 16.sp),
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
