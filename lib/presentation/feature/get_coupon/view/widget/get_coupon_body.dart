import 'package:flutter/material.dart';
import 'package:tostinh/presentation/feature/get_coupon/controller/get_coupon_controller.dart';
import 'package:tostinh/presentation/feature/get_coupon/view/widget/get_coupon_app_bar/get_coupon_app_bar.dart';

import 'get_coupon_company_section/get_coupon_company_section.dart';
import 'get_coupon_store_section/get_coupon_store_section.dart';

class GetCouponBody extends StatelessWidget {
  const GetCouponBody({super.key, required this.controller});
  final GetCouponController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        GetCouponAppBar(controller: controller),
        GetCouponCompanySection(controller: controller),
        GetCouponStoreSection(controller: controller)
      ],
    );
  }
}
