import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_constants.dart';
import 'package:tostinh/presentation/component/view/custom_item_product.dart';
import 'package:tostinh/presentation/feature/store_detail/controller/store_detail_controller.dart';
import 'package:tostinh/utils/helper/screen_helper.dart';

class StoreDetailBestSaleSection extends StatefulWidget {
  final StoreDetailController controller;

  const StoreDetailBestSaleSection({super.key, required this.controller});
  @override
  State<StatefulWidget> createState() => _StoreDetailBestSaleSectionState();
}

class _StoreDetailBestSaleSectionState extends State<StoreDetailBestSaleSection>
    with AutomaticKeepAliveClientMixin {
  StoreDetailController get controller => widget.controller;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 16.sp, right: 16.sp, top: 16.sp),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CustomItemProduct(
                onItemPressed: (item) {},
                product: controller.bestSales[index],
              ),
              childCount: controller.bestSales.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.sp,
              mainAxisSpacing: 10.sp,
              childAspectRatio: ScreenHelper.isMobile(context) ? AppConstants.aspectRatioMobileProduct : AppConstants.aspectRatioTabletProduct,
            ),
          ),
        ),
        // CustomSliverPaging(
        //   controller: controller.requestBestSaleIndicatorController,
        //   onLoadMore: controller.requestBestSale,
        // )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
