import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/presentation/component/view/custom_button_circle.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_button_linear.dart';

class CouponViewShop extends StatelessWidget {
  const CouponViewShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSurfaceWhite(context: context),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: CustomButtonLinear(
        onPressed: () {},
        height: 50.sp,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 16.sp, right: 6.sp),
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
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: CustomButtonCircle(
                    onPressed: () {},
                    buttonSize: 40.sp,
                    child: SvgPicture.asset(
                      AppIcons.trash,
                      color: kOnSurfaceVariantBlackGray(context: context),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
