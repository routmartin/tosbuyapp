import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';
import 'package:tostinh/presentation/feature/my_order_details/view/widget/my_order_details_product_info_section/my_order_details_product_info_view_item_shop.dart';
import 'package:tostinh/presentation/feature/my_order_details/view/widget/my_order_details_product_info_section/my_order_details_product_info_view_product_list.dart';

import 'my_order_details_product_info_view_shipping.dart';

class MyOrderDetailsProductInfoSection extends StatelessWidget {
  const MyOrderDetailsProductInfoSection({Key? key, required this.controller})
      : super(key: key);
  final MyOrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.hardEdge,
        child: Wrap(
          children: [
            MyOrderDetailsProductInfoViewItemShop(
              controller: controller,
            ),
            MyOrderDetailsProductInfoViewProductList(
              controller: controller,
            ),
            _buildLine(context),
            MyOrderDetailsProductInfoViewShipping(
              controller: controller,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLine(BuildContext context) {
    return Divider(
      height: 1,
      color: kOnSurfaceVariantBlackGray(context: context),
    );
  }
}
