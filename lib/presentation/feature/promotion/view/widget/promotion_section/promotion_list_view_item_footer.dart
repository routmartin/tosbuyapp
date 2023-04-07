import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/products_response.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../component/view/custom_button_linear.dart';
import '../../../controller/promotion_controller.dart';
import 'promotion_list_view_item_icon.dart';

class PromotionListViewItemFooter extends StatelessWidget {
  final PromotionController controller;
  final ProductData product;
  const PromotionListViewItemFooter({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);

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
                "\$${product.price.priceAfterDiscount.toStringAsFixed(2)}",
                style: kTextTitleBold(context: context)?.copyWith(
                  color: AppColors.red,
                ),
              ),
              SizedBox(width: 6.sp),
              Text(
                "\$${product.price.priceBeforeDiscount.toStringAsFixed(2)}",
                style: kTextHelperBold1(context: context)?.copyWith(
                  color: kOnPrimaryContainerBlackGray(context: context),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Expanded(child: Container()),
              Text(
                "${product.totalSale} ${AppLocals.storePromotionSold.tr}",
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
                "${product.totalRating}",
                style: kTextHelperNormal1(context: context)?.copyWith(
                  color: kOnPrimaryContainerBlackGray(context: context),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.sp),
          Text(
            product.name,
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
                onPressed: () => Get.toNamed(
                  AppRoutes.storeDetail,
                  arguments: product.store.id,
                ),
                child: PromotionListViewItemIcon(
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
                onPressed: () => controller.addWishlist(productId: product.id),
                child: PromotionListViewItemIcon(
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
                child: PromotionListViewItemIcon(
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
                  padding: EdgeInsets.only(
                    left: 4.sp,
                    right: 14.sp,
                    top: 4.sp,
                    bottom: 4.sp,
                  ),
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
                      SizedBox(width: 10.sp),
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
