import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';


class StoreDetailHomeViewCheckCoupon extends StatelessWidget {
  const StoreDetailHomeViewCheckCoupon({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomButtonLinear(
        onPressed: () {},
        backgroundColor: kPrimaryWhite(context: context),
        width: double.infinity,
        height: 43.sp,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Save up to US \$8.00",
                style: kTextTitleNormal(context: context),
              ),
              Wrap(
                children: [
                  SvgPicture.asset(
                    AppIcons.discountDollar,
                    width: 30.sp,
                    height: 17.sp,
                  ),
                  SizedBox(width: 5.sp),
                  SvgPicture.asset(
                    AppIcons.discountPercentage,
                    width: 30.sp,
                    height: 17.sp,
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
