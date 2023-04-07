import 'package:flutter/material.dart';

import '../../../../../component/view/custom_request_indicator.dart';
import '../../../controller/cart_controller.dart';
import 'cart_list_view_item_cart.dart';

class CartListSection extends StatelessWidget {
  final CartController controller;

  const CartListSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRequestIndicator(
      controller: controller.indicatorController,
      onLoad: controller.getCart,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CartListViewItemCart(
                controller: controller,
                cartIndex: index,
                cart: controller.carts[index],
              ),
              childCount: controller.carts.length,
            ),
          ),
        ],
      ),
    );
  }
}
