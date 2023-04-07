import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';

class MyOrderOrderListViewItemOrderViewAll extends StatelessWidget {
  const MyOrderOrderListViewItemOrderViewAll(
      {Key? key, required this.controller})
      : super(key: key);
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      onPressed: () {},
      width: double.infinity,
      height: 45.sp,
      backgroundColor: kSurfaceWhite(context: context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "View all 4 product",
            textAlign: TextAlign.center,
            style: kTextDescriptionBold(context: context)?.copyWith(
              color: kOnSurfaceVariantBlackGray(context: context),
            ),
          ),
          SvgPicture.asset(
            AppIcons.arrowDropDown,
            color: kOnSurfaceVariantBlackGray(context: context),
          )
        ],
      ),
    );
  }
}
