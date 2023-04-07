import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_button_bottom.dart';
import 'package:tostinh/presentation/feature/coupon/controller/coupon_controller.dart';
import 'package:tostinh/presentation/feature/coupon/view/widget/coupon_view/coupon_view_item.dart';
import 'package:tostinh/routes/app_routes.dart';

class CouponBody extends StatelessWidget {
  const CouponBody({super.key, required this.controller});
  final CouponController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Column(
                        children: [
                          const CouponViewItem(),
                          SizedBox(
                            height: 10.sp,
                          )
                        ],
                      ),
                      childCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: CustomButtonBottom(
              title: "Get coupon",
              onPressed: () {
                Get.toNamed(AppRoutes.getCoupon);
              },
            ),
          )
        ],
      ),
    );
  }
}
