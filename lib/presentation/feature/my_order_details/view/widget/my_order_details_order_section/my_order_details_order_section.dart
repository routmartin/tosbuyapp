import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';

class MyOrderDetailsOrderSection extends StatelessWidget {
  const MyOrderDetailsOrderSection({super.key, required this.controller});
  final MyOrderDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Material(
        color: kPrimaryWhite(context: context),
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocals.orderId.tr,
                    style: kTextDescriptionBold(context: context)?.copyWith(
                      color: kOnPrimaryContainerBlackGray(context: context),
                    ),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    AppLocals.orderDate.tr,
                    style: kTextDescriptionBold(context: context)?.copyWith(
                      color: kOnPrimaryContainerBlackGray(context: context),
                    ),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    AppLocals.orderPaymentMethod.tr,
                    style: kTextDescriptionBold(context: context)?.copyWith(
                      color: kOnPrimaryContainerBlackGray(context: context),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "8459415878",
                    style: kTextDescriptionBold(context: context),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    "15-27-2020",
                    style: kTextDescriptionBold(context: context),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Text(
                    "Waiting for supplier delivery",
                    style: kTextDescriptionBold(context: context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
