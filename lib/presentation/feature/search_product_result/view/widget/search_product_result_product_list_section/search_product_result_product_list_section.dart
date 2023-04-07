import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_constants.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/search_product_result/controller/search_product_result_controller.dart';
import 'package:tostinh/utils/helper/screen_helper.dart';

import '../../../../../component/view/custom_item_product.dart';

class SearchProductResultProductListSection extends StatelessWidget {
  final SearchProductResultController controller;
  const SearchProductResultProductListSection(
      {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: kPrimaryContainerWhiteGray(context: context),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: controller.products.length,
                  (context, index) => CustomItemProduct(
                    onItemPressed: (item) {
                      // Get.toNamed(AppRoutes.productDetail);
                    },
                    product: controller.products[index],
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.sp,
                    crossAxisSpacing: 10.sp,
                    childAspectRatio: ScreenHelper.isMobile(context)
                        ? AppConstants.aspectRatioMobileProduct
                        : AppConstants.aspectRatioTabletProduct),
              ),
            ),
            // CustomSliverPaging(
            //     controller: controller.requestIndicatorController,
            //     onLoadMore: controller.requestMoreProduct)
          ],
        ),
      ),
    );
  }
}
