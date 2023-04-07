import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/coupon/controller/coupon_controller.dart';
import 'package:tostinh/presentation/feature/coupon/view/widget/coupon_app_bar.dart';
import 'package:tostinh/presentation/feature/coupon/view/widget/coupon_body.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponController>(
      init: CouponController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryContainerWhiteGray(context: context),
        appBar: CouponAppBar(
          controller: controller,
        ),
        body: CouponBody(
          controller: controller,
        ),
      ),
    );
  }
}
