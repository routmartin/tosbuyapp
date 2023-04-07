import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/category/controller/category_controller.dart';

import '../../../../../../assets/app_constants.dart';
import '../../../../../component/view/custom_item_product.dart';

class CategoryProductGridViewLayout extends StatelessWidget {
  final CategoryController controller;
  const CategoryProductGridViewLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => CustomItemProduct(
            onItemPressed: (item) {},
            product: controller.products[index],
          ),
          childCount: controller.products.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.sp,
          mainAxisSpacing: 10.sp,
          childAspectRatio: AppConstants.aspectRatioMobileProduct,
        ),
      ),
    );
  }
}
