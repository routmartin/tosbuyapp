import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../custom_button_linear.dart';
import 'custom_big_product_icon.dart';

class CustomBigProductItemFooter extends StatelessWidget {
  const CustomBigProductItemFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "\$196.00",
                style: kTextTitleBold(context: context)?.copyWith(
                  color: AppColors.red,
                ),
              ),
              SizedBox(width: 6.sp),
              Text(
                "\$396.00",
                style: kTextHelperBold1(context: context)?.copyWith(
                  color: kOnPrimaryContainerBlackGray(context: context),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Expanded(child: Container()),
              Text(
                "1200 ${AppLocals.storePromotionSold.tr}",
                style: kTextHelperNormal1(context: context)?.copyWith(
                  color: kOnPrimaryContainerBlackGray(context: context),
                ),
              ),
              SizedBox(width: 10.sp),
              const Icon(
                Icons.star,
                color: AppColors.pink,
                size: 12,
              ),
              SizedBox(width: 2.sp),
              Text(
                "4.8",
                style: kTextHelperNormal1(context: context)?.copyWith(
                  color: kOnPrimaryContainerBlackGray(context: context),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.sp),
          Text(
            "Apple Watch Series 8",
            style: kTextDescriptionNormal(context: context),
          ),
          SizedBox(height: 11.sp),
          Row(
            children: [
              CustomButtonLinear(
                padding: EdgeInsets.all(2.sp),
                borderRadius: 4,
                width: 50.sp,
                height: 50.sp,
                onPressed: () {},
                child: CustomBigProductIcon(
                  iconPath: AppIcons.store,
                  label: AppLocals.storeTitle.tr,
                ),
              ),
              SizedBox(width: 10.sp),
              CustomButtonLinear(
                padding: EdgeInsets.all(2.sp),
                borderRadius: 4,
                width: 50.sp,
                height: 50.sp,
                onPressed: () {},
                child: CustomBigProductIcon(
                  iconPath: AppIcons.loveWishlist,
                  label: AppLocals.storePromotionWishlist.tr,
                ),
              ),
              SizedBox(width: 10.sp),
              CustomButtonLinear(
                padding: EdgeInsets.all(2.sp),
                borderRadius: 4,
                width: 50.sp,
                height: 50.sp,
                onPressed: () {},
                child: CustomBigProductIcon(
                  iconPath: AppIcons.share,
                  label: AppLocals.storePromotionShare.tr,
                ),
              ),
              Expanded(child: Container()),
              CustomButtonLinear(
                borderRadius: 12,
                backgroundColor: kOnPrimaryBlack(context: context),
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(4.sp),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kOnPrimaryContainerBlackGray(context: context)
                              .withOpacity(0.15),
                        ),
                        padding: EdgeInsets.all(10.5.sp),
                        child: SvgPicture.asset(AppIcons.shoppingCart),
                      ),
                      SizedBox(width: 14.sp),
                      Text(
                        AppLocals.storePromotionOrderNow.tr,
                        style: kTextTitleBold(context: context)?.copyWith(
                          color: kPrimaryWhite(context: context),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
