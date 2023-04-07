import 'package:flutter/material.dart';
import 'package:tostinh/presentation/feature/get_coupon/controller/get_coupon_controller.dart';
import 'package:tostinh/presentation/feature/get_coupon/view/widget/get_coupon_app_bar/get_coupon_app_bar_view_sliver_delegate.dart';

class GetCouponAppBar extends StatelessWidget {
  const GetCouponAppBar({super.key, required this.controller});
  final GetCouponController controller;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: GetCouponAppBarViewSliverDelegate(),
      floating: true,
      pinned: true,
    );
  }
}
