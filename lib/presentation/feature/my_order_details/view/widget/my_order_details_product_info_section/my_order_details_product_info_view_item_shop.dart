import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';

class MyOrderDetailsProductInfoViewItemShop extends StatelessWidget {
  const MyOrderDetailsProductInfoViewItemShop({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MyOrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      onPressed: () {},
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
