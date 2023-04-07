import 'package:flutter/material.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';
import 'package:tostinh/presentation/feature/my_order/view/widget/my_order_order_list_section/my_order_order_list_view_item_order.dart';

class MyOrderOrderListSection extends StatelessWidget {
  final MyOrderController controller;
  const MyOrderOrderListSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MyOrderOrderViewItemOrder(controller: controller),
        MyOrderOrderViewItemOrder(controller: controller)
      ],
    );
  }
}
