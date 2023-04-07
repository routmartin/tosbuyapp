import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_choice_chips_single.dart';
import 'package:tostinh/presentation/feature/get_coupon/controller/get_coupon_controller.dart';

class GetCouponStoreViewFilter extends StatelessWidget {
  const GetCouponStoreViewFilter({super.key, required this.controller});
  final GetCouponController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: CustomChoiceChipsSingle(
        backgroundSelectedColor: kInverseSurfaceBlack(context: context),
        backgroundUnselectedColor: kSurfaceVariantWhiteGray(context: context),
        borderSelectedColor: Colors.transparent,
        borderUnselectedColor: Colors.transparent,
        textSelectedColor: kOnInverseSurfaceWhite(context: context),
        textUnselectedColor: kOnSurfaceVariantBlackGray(context: context),
        list: controller.choiceChipsDatas,
        radius: 30,
        spacing: 4,
      ),
    );
  }
}
