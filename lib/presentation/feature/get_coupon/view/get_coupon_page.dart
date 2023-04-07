import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tostinh/presentation/feature/get_coupon/controller/get_coupon_controller.dart';
import 'package:tostinh/presentation/feature/get_coupon/view/widget/get_coupon_body.dart';

class GetCouponPage extends StatelessWidget {
  const GetCouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetCouponController>(
      init: GetCouponController(),
      builder: (controller) => Scaffold(
        body: GetCouponBody(controller: controller),
      ),
    );
  }
}
