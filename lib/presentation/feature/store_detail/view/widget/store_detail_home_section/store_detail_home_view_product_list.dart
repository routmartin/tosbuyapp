import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/store_detail/controller/store_detail_controller.dart';
import 'package:tostinh/utils/helper/screen_helper.dart';

import '../../../../../../assets/app_constants.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../component/view/custom_item_product.dart';
import '../../../../product_detail/controller/product_detail_controller.dart';

class StoreDetailHomeViewProductList extends StatelessWidget {
  final StoreDetailController controller;
  const StoreDetailHomeViewProductList({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16.sp, right: 16.sp, top: 16.sp),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return CustomItemProduct(
            onItemPressed: (item) {
              Get.delete<ProductDetailController>();
              Get.toNamed(
                AppRoutes.productDetail,
                arguments: item,
              );
            },
            product: controller.products[index],
          );
        }, childCount: controller.products.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.sp,
          mainAxisSpacing: 10.sp,
          childAspectRatio: ScreenHelper.isMobile(context)
              ? AppConstants.aspectRatioMobileProduct
              : AppConstants.aspectRatioTabletProduct,
        ),
      ),
    );
  }
}
