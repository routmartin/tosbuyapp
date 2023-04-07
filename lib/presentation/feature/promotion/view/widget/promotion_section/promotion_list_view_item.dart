import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';
import 'package:tostinh/presentation/feature/promotion/controller/promotion_controller.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/products_response.dart';
import '../../../../../component/view/custom_discount_shape.dart';
import 'promotion_list_view_item_footer.dart';

class PromotionListViewItem extends StatelessWidget {
  final PromotionController controller;
  final ProductData product;
  const PromotionListViewItem({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.productDetail, arguments: product),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        color: kSurfaceWhite(context: context),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CustomCachedImage(
                    imageUrl: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.sp),
                  child: CustomPaint(
                    painter: CustomDiscountShape(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.sp,
                        vertical: 4.sp,
                      ),
                      child: Text(
                        "-${product.price.discountPercentage}%",
                        style: kTextHelperBold1(context: context)?.copyWith(
                          color: kPrimaryWhite(context: context),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            PromotionListViewItemFooter(
              controller: controller,
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
