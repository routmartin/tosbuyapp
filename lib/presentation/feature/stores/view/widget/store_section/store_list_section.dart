import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/view/custom_request_indicator.dart';
import '../../../../../component/view/custom_sliver_paging.dart';
import '../../../controller/store_controller.dart';
import 'store_list_view_item_store.dart';

class StoreListSection extends StatelessWidget {
  final StoreController controller;

  const StoreListSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRequestIndicator(
      controller: controller.requestController,
      onLoad: controller.getStores,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.sp),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    StoreListViewItemStore(
                      controller: controller,
                      item: controller.stores[index],
                    ),
                    if (index != controller.stores.length)
                      SizedBox(height: 16.sp),
                  ],
                ),
                childCount: controller.stores.length,
              ),
            ),
          ),
          CustomSliverPaging(
            onLoadMore: controller.getMoreStores,
            controller: controller.requestController,
          ),
        ],
      ),
    );
  }
}
