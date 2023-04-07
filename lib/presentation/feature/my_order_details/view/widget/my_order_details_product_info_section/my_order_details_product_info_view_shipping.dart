import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';

class MyOrderDetailsProductInfoViewShipping extends StatelessWidget {
  const MyOrderDetailsProductInfoViewShipping(
      {Key? key, required this.controller})
      : super(key: key);
  final MyOrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kOnInverseSurfaceWhite(context: context),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocals.orderShipping.tr,
                  style: kTextDescriptionBold(context: context)?.copyWith(
                    color: kOnPrimaryContainerBlackGray(context: context),
                  ),
                ),
                SizedBox(
                  height: 4.sp,
                ),
                Text(
                  AppLocals.orderTotal.tr,
                  style: kTextDescriptionBold(context: context)?.copyWith(
                    color: kOnPrimaryContainerBlackGray(context: context),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "USD 1.00",
                  style: kTextDescriptionBold(context: context)?.copyWith(
                    color: kOnPrimaryContainerBlackGray(context: context),
                  ),
                ),
                SizedBox(
                  height: 4.sp,
                ),
                Text(
                  "USD 148.00",
                  style: kTextDescriptionBold(context: context)?.copyWith(
                    color: AppColors.red,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
