import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_constants.dart';
import 'package:tostinh/domain/entities/response/products_response.dart';
import 'package:tostinh/presentation/component/view/custom_item_product.dart';
import 'package:tostinh/routes/app_routes.dart';
import 'package:tostinh/utils/helper/screen_helper.dart';

class HomeRecommendProductSection extends StatelessWidget {
  final List<ProductData> products;
  const HomeRecommendProductSection({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ScreenHelper.isMobile(context) ? 2 : 4,
          crossAxisSpacing: 10.sp,
          mainAxisSpacing: 10.sp,
          childAspectRatio: ScreenHelper.isMobile(context) ? AppConstants.aspectRatioMobileProduct : AppConstants.aspectRatioTabletProduct,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CustomItemProduct(
              onItemPressed: (item) {
                Get.toNamed(AppRoutes.productDetail, arguments: item);
              },
              product: products[index],
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
