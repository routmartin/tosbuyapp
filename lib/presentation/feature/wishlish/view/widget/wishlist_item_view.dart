import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';
import 'package:tostinh/presentation/feature/wishlish/view/widget/wishlist_action_button.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../../domain/entities/response/wishlist_responses.dart';
import '../../controller/wishlisth_controller.dart';

class WishListItemView extends StatelessWidget {
  final Product wishlist;

  const WishListItemView({
    Key? key,
    required this.wishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: .35,
        children: [
          SlidableAction(
            onPressed: (context) {
              Get.find<WishlishController>()
                  .confirmRemoveItemFromWishlist(wishlist.wishlistId!);
            },
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        color: kPrimaryWhite(context: context),
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.sp),
              child: SizedBox(
                width: 100.sp,
                height: 100.sp,
                child: Stack(
                  children: [
                    CustomCachedImage(
                      imageUrl: wishlist.image,
                      fit: BoxFit.cover,
                    ),
                    if (wishlist.qtyOnHand == 0)
                      Positioned.fill(
                        child: Center(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(color: Colors.black.withOpacity(0.2)),
                                Text(
                                  AppLocals.notAvailable.tr,
                                  textAlign: TextAlign.center,
                                  style: kTextTitleNormal(context: context)
                                      ?.copyWith(color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          wishlist.name!,
                          style: kTextDescriptionBold(context: context),
                        ),
                      ),
                      WishlistActionButton(
                          icon: AppIcons.buyNow,
                          onPressed: () => Get.find<WishlishController>()
                              .goToProductDetail(wishlist.productId!)),
                      SizedBox(width: 10.sp),
                      WishlistActionButton(
                        icon: AppIcons.wishList,
                        onPressed: () => Get.find<WishlishController>()
                            .confirmRemoveItemFromWishlist(
                          wishlist.wishlistId!,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.sp),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${wishlist.totalSale ?? 0} sold",
                        style: kTextHelperNormal2(context: context),
                      ),
                      SizedBox(width: 10.sp),
                      Icon(
                        Icons.star,
                        size: 12.w,
                        color: AppColors.pink,
                      ),
                      SizedBox(width: 2.sp),
                      Text("${wishlist.averageRate ?? 0}",
                          style: kTextHelperNormal2(context: context)),
                    ],
                  ),
                  SizedBox(height: 20.sp),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "\$ ${wishlist.salePrice?.toStringAsFixed(2)}",
                          style: kTextTitleBold(context: context),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
