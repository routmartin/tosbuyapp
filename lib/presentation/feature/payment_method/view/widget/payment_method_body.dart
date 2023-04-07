import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/view/custom_request_indicator.dart';
import '../../controller/payment_method_controller.dart';
import 'payment_method_view_item.dart';

class PaymentMethodBody extends StatelessWidget {
  final PaymentMethodController controller;

  const PaymentMethodBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRequestIndicator(
      onLoad: controller.getPaymentMethod,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    if (index == 0) SizedBox(height: 10.sp),
                    PaymentMethodViewItem(
                      controller: controller,
                      paymentMethod: controller.paymentMethods[index],
                    ),
                    if (index != controller.paymentMethods.length)
                      SizedBox(height: 10.sp),
                  ],
                ),
                childCount: controller.paymentMethods.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
