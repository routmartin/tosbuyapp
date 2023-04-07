import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_constants.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/feature/product_detail/controller/product_detail_controller.dart';

import '../../../../../../routes/app_routes.dart';
import '../../../../../component/view/custom_item_product.dart';

class ProductDetailRelatedViewProductList extends StatelessWidget {
  final ProductDetailController controller;
  const ProductDetailRelatedViewProductList(
      {Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomRequestIndicator(
        onLoad: controller.requestRelatedProduct,
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.sp,
            mainAxisSpacing: 10.sp,
            childAspectRatio: AppConstants.aspectRatioMobileProduct,
          ),
          itemCount: controller.productRelated.length,
          itemBuilder: ((context, index) {
            return CustomItemProduct(
              onItemPressed: (item) => Get.toNamed(
                AppRoutes.productDetail,
                arguments: item,
              ),
              product: controller.productRelated[index],
            );
          }),
        ),
      ),
    );
  }
}
