import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/coupon/controller/coupon_controller.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_app_bar.dart';

class CouponAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CouponAppBar({super.key, required this.controller});
  final CouponController controller;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: () {
        Get.back();
      },
      title: AppLocals.coupon.tr,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
