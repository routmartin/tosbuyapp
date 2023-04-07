import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/category/controller/category_controller.dart';

import '../../../../../component/view/custom_big_product_item_section/custom_big_product_item.dart';

class CategoryProductListViewLayout extends StatelessWidget {
  final CategoryController controller;
  const CategoryProductListViewLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Column(
            children: [
              SizedBox(height: 16.sp),
              const CustomBigProductItem(),
            ],
          ),
          childCount: controller.products.length,
        ),
      ),
    );
  }
}
