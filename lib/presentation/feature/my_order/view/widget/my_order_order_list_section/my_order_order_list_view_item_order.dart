import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';

import '../../../../../../assets/app_styles.dart';
import 'my_order_order_list_view_item_order_date_price.dart';
import 'my_order_order_list_view_item_order_product.dart';
import 'my_order_order_list_view_item_order_shop.dart';
import 'my_order_order_list_view_item_order_view_all.dart';
import 'my_order_order_list_view_item_order_waiting_supplier.dart';

class MyOrderOrderViewItemOrder extends StatelessWidget {
  final MyOrderController controller;
  const MyOrderOrderViewItemOrder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
          child: Wrap(
        children: [
          MyOrderOrderListViewItemOrderShop(controller: controller),
          MyOrderOrderListViewItemOrderProduct(controller: controller),
          Divider(
            height: 0.5.sp,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
          MyOrderOrderListViewItemOrderViewAll(
            controller: controller,
          ),
          Divider(
            height: 0.5.sp,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
          MyOrderOrderListViewItemOrderDatePrice(
            controller: controller,
          ),
          Divider(
            height: 0.5.sp,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
          MyOrderOrderListViewItemOrderWaitingSupplier(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
