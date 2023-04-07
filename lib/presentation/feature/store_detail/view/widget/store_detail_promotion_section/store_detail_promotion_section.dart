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
import '../../../controller/store_detail_controller.dart';

class StoreDetailPromotionSection extends StatefulWidget {
  final StoreDetailController controller;

  const StoreDetailPromotionSection({super.key, required this.controller});
  @override
  State<StatefulWidget> createState() => _StoreDetailPromotionSectionState();
}

class _StoreDetailPromotionSectionState
    extends State<StoreDetailPromotionSection>
    with AutomaticKeepAliveClientMixin {
  StoreDetailController get controller => widget.controller;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomRequestIndicator(
      controller: widget.controller.requestPromotionIndicatorController,
      onLoad: widget.controller.requestFirstPromotion,
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
                      Get.toNamed(AppRoutes.productDetail, arguments: item);
                    },
                    product: controller.promotions[index],
                  );
                },
                childCount: controller.promotions.length,
              ),
            ),
          ),
          CustomSliverPaging(
            controller: controller.requestPromotionIndicatorController,
            onLoadMore: widget.controller.requestMorePromotion,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
