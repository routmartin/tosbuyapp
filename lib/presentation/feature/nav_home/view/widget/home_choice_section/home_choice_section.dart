import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_choice_section/home_choice_view_best_seller_button.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_choice_section/home_choice_view_categories_button.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_choice_section/home_choice_view_promotions_button.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_choice_section/home_choice_view_store_button.dart';

class HomeChoiceSection extends StatelessWidget {
  final HomeController controller;
  const HomeChoiceSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 16.sp,
              ),
              HomeChoiceViewCategoriesButton(controller: controller),
              SizedBox(
                width: 10.sp,
              ),
              HomeChoiceViewPromotionsButton(controller: controller),
              SizedBox(
                width: 10.sp,
              ),
              HomeChoiceViewBestSellerButton(controller: controller),
              SizedBox(
                width: 10.sp,
              ),
              HomeChoiceViewStoreButton(controller: controller),
              SizedBox(
                width: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
