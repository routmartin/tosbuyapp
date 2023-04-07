import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_app_bar.dart';

class GetCouponAppBarViewSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var result = maxExtent - minExtent;
    final expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));
    final interpolatedBackgroundColor = Color.lerp(
      kPrimaryWhite(context: context),
      Colors.transparent,
      expendPercentage,
    );
    return CustomAppBar(
      onTapLeft: () {
        Get.back();
      },
      title: shrinkOffset > result ? "Get Coupon" : "",
      background: Container(
        foregroundDecoration: BoxDecoration(color: interpolatedBackgroundColor),
        child: SvgPicture.asset(
          AppIcons.backgroundProfile,
          fit: BoxFit.fitWidth,
        ),
      ),
      actions: [
        IconButtonAppBar(
          onPressed: () {},
          child: SvgPicture.asset(
            AppIcons.search,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
        ),
        SizedBox(
          width: 16.sp,
        ),
        IconButtonAppBar(
          onPressed: () {},
          child: SvgPicture.asset(
            AppIcons.shareOutline,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 88;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
