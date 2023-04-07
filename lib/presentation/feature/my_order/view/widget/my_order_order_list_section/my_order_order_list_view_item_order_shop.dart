import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';
import 'package:tostinh/routes/app_routes.dart';

class MyOrderOrderListViewItemOrderShop extends StatelessWidget {
  const MyOrderOrderListViewItemOrderShop({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      onPressed: () {
        Get.toNamed(AppRoutes.storeDetail);
      },
      height: 50.sp,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Row(
          children: [
            const Icon(
              Icons.shop_2_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 8.sp,
            ),
            Text(
              "Man Fashion KH",
              style: kTextTitleBold(context: context),
            )
          ],
        ),
      ),
    );
  }
}
