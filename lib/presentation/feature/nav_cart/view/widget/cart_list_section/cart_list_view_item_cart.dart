import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/cart_response.dart';
import '../../../controller/cart_controller.dart';
import 'cart_list_view_item_cart_product.dart';
import 'cart_list_view_item_cart_store.dart';

class CartListViewItemCart extends StatelessWidget {
  final CartController controller;
  final int cartIndex;
  final Cart cart;

  const CartListViewItemCart({
    Key? key,
    required this.controller,
    required this.cartIndex,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryWhite(context: context),
      margin: EdgeInsets.symmetric(vertical: 5.sp),
      child: Column(
        children: [
          CartListViewItemCartStore(cart: cart),
          Divider(
            color: kPrimaryContainerWhiteGray(context: context),
            thickness: 1.sp,
            height: 1.sp,
          ),
          ListView.builder(
            itemCount: cart.products.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return CartListViewItemCartProduct(
                controller: controller,
                cartIndex: cartIndex,
                productIndex: index,
                product: cart.products[index],
              );
            }),
          )
        ],
      ),
    );
  }
}
