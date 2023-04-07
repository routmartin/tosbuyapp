import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';

class MyOrderOrderListViewItemOrderDatePrice extends StatelessWidget {
  const MyOrderOrderListViewItemOrderDatePrice(
      {Key? key, required this.controller})
      : super(key: key);
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.sp,
      color: kSurfaceWhite(context: context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "15-07-2020",
              style: kTextDescriptionBold(context: context)?.copyWith(
                color: kOnSurfaceVariantBlackGray(context: context),
              ),
            ),
            Text(
              "USD 148.00",
              style: kTextDescriptionBold(context: context)?.copyWith(
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
