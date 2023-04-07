import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_button_linear.dart';

class MyOrderDetailsAddressSection extends StatelessWidget {
  const MyOrderDetailsAddressSection({super.key, required this.controller});
  final MyOrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: CustomButtonLinear(
        onPressed: () {},
        borderRadius: 16,
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppIcons.locationFill,
              ),
              SizedBox(
                width: 16.sp,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "School",
                      style: kTextHeadline3(context: context),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      "+885 98655447",
                      style: kTextHelperNormal1(context: context),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      "#01, St 310, Toul Kok, Phnom Penh",
                      style: kTextHelperNormal1(context: context)?.copyWith(
                        color: kOnPrimaryContainerBlackGray(context: context),
                      ),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                AppIcons.editLocation,
              )
            ],
          ),
        ),
      ),
    );
  }
}
