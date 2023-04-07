import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../assets/app_constants.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../../utils/helper/screen_helper.dart';
import '../../../../../component/view/custom_item_product.dart';
import '../../../../../component/view/custom_request_indicator.dart';
import '../../../../../component/view/custom_sliver_paging.dart';
import '../../../../product_detail/controller/product_detail_controller.dart';
import '../../../controller/product_related_controller.dart';

class ProductRelatedListSection extends StatefulWidget {
  final ProductRelatedController controller;

  const ProductRelatedListSection({super.key, required this.controller});
  @override
  State<StatefulWidget> createState() => _ProductRelatedListSectionState();
}

class _ProductRelatedListSectionState extends State<ProductRelatedListSection>
    with AutomaticKeepAliveClientMixin {
  ProductRelatedController get controller => widget.controller;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomRequestIndicator(
      controller: widget.controller.indicatorController,
      onLoad: widget.controller.requestFirstRelated,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.sp),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ScreenHelper.isMobile(context) ? 2 : 4,
                crossAxisSpacing: 10.sp,
                mainAxisSpacing: 10.sp,
                childAspectRatio: ScreenHelper.isMobile(context)
                    ? AppConstants.aspectRatioMobileProduct
                    : AppConstants.aspectRatioTabletProduct,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CustomItemProduct(
                    onItemPressed: (item) {
                      Get.delete<ProductDetailController>();
                      Get.toNamed(
                        AppRoutes.productDetail,
                        arguments: item,
                        preventDuplicates: false
                      );
                    },
                    product: controller.relateds[index],
                  );
                },
                childCount: controller.relateds.length,
              ),
            ),
          ),
          CustomSliverPaging(
            controller: controller.indicatorController,
            onLoadMore: widget.controller.requestMoreRelated,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
