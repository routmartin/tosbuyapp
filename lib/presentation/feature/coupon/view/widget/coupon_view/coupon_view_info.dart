import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';

class CouponViewInfo extends StatelessWidget {
  const CouponViewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: kSurfaceWhite(context: context)),
      child: Container(
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
            color: ColorPinkVariant.light,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            _couponPrice(context: context),
            SizedBox(
              height: 10.sp,
            ),
            _couponOverPrice(context: context),
            SizedBox(
              height: 10.sp,
            ),
            _couponValidateDate(context: context)
          ],
        ),
      ),
    );
  }

  Widget _couponPrice({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "US \$5.00",
          style: kTextTitleBold(context: context),
        ),
        Container(
          height: 17.sp,
          alignment: Alignment.center,
          color: kOnInverseSurfaceWhite(context: context),
          child: DottedBorder(
            strokeWidth: 0.5,
            color: AppColors.pink,
            borderType: BorderType.RRect,
            radius: const Radius.circular(4),
            child: Text(
              "COUPON0007",
              style: kTextHelperNormal2(context: context)?.copyWith(
                color: kOnSurfaceVariantBlackGray(context: context),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _couponOverPrice({required BuildContext context}) {
    return Row(
      children: [
        Text(
          "Orders Over US \$25.00",
          style: kTextDescriptionNormal(context: context),
        )
      ],
    );
  }

  Widget _couponValidateDate({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Valid until 01-01-2023",
          style: kTextHelperNormal1(context: context)?.copyWith(
            color: kOnSurfaceVariantBlackGray(context: context),
          ),
        ),
        CustomButtonLinear(
          onPressed: () {},
          borderColor: kOnSurfaceVariantBlackGray(context: context),
          borderSize: 0.5,
          borderRadius: 8,
          height: 30.sp,
          width: 90.sp,
          child: Text(
            AppLocals.useNow.tr,
            style: kTextTitleBold(context: context),
          ),
        )
      ],
    );
  }
}
