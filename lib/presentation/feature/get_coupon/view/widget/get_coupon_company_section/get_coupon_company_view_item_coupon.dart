import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';

class GetCouponCompanyViewItemCoupon extends StatelessWidget {
  const GetCouponCompanyViewItemCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 313.sp,
      height: 84.sp,
      child: Stack(
        children: [
          SvgPicture.asset(
            AppIcons.bgCompanyCoupon,
            fit: BoxFit.cover,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: 200.sp,
                height: 84.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "US \$2.00",
                      style: kTextHeadline3(context: context)?.copyWith(
                        color: kOnInverseSurfaceWhite(context: context),
                      ),
                    ),
                    Text(
                      "Spend US \$30, Get US \$2.00 off",
                      style: kTextHelperNormal1(context: context)?.copyWith(
                        color: kOnInverseSurfaceWhite(context: context),
                      ),
                    ),
                    Text(
                      "Expires July 30, 22:00",
                      style: kTextHelperNormal1(context: context)?.copyWith(
                        color: kOnInverseSurfaceWhite(context: context),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 113.sp,
                height: 84.sp,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: CustomButtonLinear(
                  onPressed: () {},
                  borderRadius: 24,
                  child: Text(
                    "Get it now",
                    style: kTextDescriptionBold(context: context)
                        ?.copyWith(color: AppColors.pink),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
