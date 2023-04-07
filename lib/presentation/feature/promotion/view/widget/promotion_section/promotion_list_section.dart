import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../component/view/custom_request_indicator.dart';
import '../../../../../component/view/custom_sliver_paging.dart';
import '../../../controller/promotion_controller.dart';
import 'promotion_list_view_item.dart';

class PromotionListSection extends StatefulWidget {
  final PromotionController controller;

  const PromotionListSection({super.key, required this.controller});
  @override
  State<StatefulWidget> createState() => _PromotionListSectionState();
}

class _PromotionListSectionState extends State<PromotionListSection>
    with AutomaticKeepAliveClientMixin {
  PromotionController get controller => widget.controller;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomRequestIndicator(
      controller: widget.controller.indicatorController,
      onLoad: widget.controller.requestFirstPromotion,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 16.sp),
                      PromotionListViewItem(
                        controller: controller,
                        product: controller.promotions[index],
                      ),
                    ],
                  );
                },
                childCount: widget.controller.promotions.length,
              ),
            ),
          ),
          CustomSliverPaging(
            controller: controller.indicatorController,
            onLoadMore: widget.controller.requestMorePromotion,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
