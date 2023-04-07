import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';

import 'home_flash_sale_view_count_down.dart';
import 'home_flash_sale_view_products.dart';

class HomeFlashSaleSection extends StatelessWidget {
  const HomeFlashSaleSection({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: kSurfaceWhite(context: context),
          ),
          padding: EdgeInsets.all(10.sp),
          child: Wrap(
            children: [
              HomeFlashSaleViewCountDown(
                controller: controller,
              ),
              HomeFlashSaleViewProducts(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
