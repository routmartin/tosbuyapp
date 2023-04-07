import 'package:flutter/material.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';
import 'package:tostinh/presentation/feature/store_detail/controller/store_detail_controller.dart';
import 'package:tostinh/presentation/feature/store_detail/view/widget/store_detail_home_section/store_detail_home_view_check_coupon.dart';
import 'package:tostinh/presentation/feature/store_detail/view/widget/store_detail_home_section/store_detail_home_view_product_list.dart';

class StoreDetailHomeSection extends StatefulWidget {
  final StoreDetailController controller;

  const StoreDetailHomeSection({super.key, required this.controller});
  @override
  State<StatefulWidget> createState() => _StoreDetailHomeSectionState();
}

class _StoreDetailHomeSectionState extends State<StoreDetailHomeSection>
    with AutomaticKeepAliveClientMixin {
  StoreDetailController get controller => widget.controller;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomRequestIndicator(
      controller: controller.requestHomeIndicatorController,
      onLoad: widget.controller.requestFirstProduct,
      child: CustomScrollView(
          slivers: [
            const StoreDetailHomeViewCheckCoupon(),
            StoreDetailHomeViewProductList(controller: widget.controller),
            CustomSliverPaging(
              controller: controller.requestHomeIndicatorController,
              onLoadMore: widget.controller.requestMoreProduct,
            )
          ],
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
