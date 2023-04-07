import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets/app_colors.dart';
import '../../../assets/app_icons.dart';
import '../../../assets/app_styles.dart';
import '../../../domain/entities/response/products_response.dart';
import 'custom_cached_image.dart';
import 'custom_discount_shape.dart';

class CustomItemProduct extends StatelessWidget {
  final Function(ProductData product) onItemPressed;
  final ProductData product;
  const CustomItemProduct({
    Key? key,
    required this.onItemPressed,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemPressed.call(product),
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
                if (product.price.discountAmount > 0.0)
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
                          "-${product.price.discountPercentage.toStringAsFixed(0)}%",
                          style: kTextHelperBold1(context: context)?.copyWith(
                            color: kPrimaryWhite(context: context),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: kTextDescriptionNormal(context: context),
                  ),
                  SizedBox(height: 2.sp),
                  Row(
                    children: [
                      Text(
                        "\$${product.price.priceAfterDiscount.toStringAsFixed(2)}",
                        style: kTextDescriptionBold(context: context)
                            ?.copyWith(color: AppColors.red),
                      ),
                      SizedBox(width: 6.sp),
                      if (product.price.discountAmount > 0.0)
                        Text(
                          "\$${product.price.priceBeforeDiscount.toStringAsFixed(2)}",
                          style: kTextHelperBold1(context: context)?.copyWith(
                            color: kOnPrimaryContainerBlackGray(
                              context: context,
                            ),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 2.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "${product.totalSale} sold",
                          style: kTextHelperNormal1(context: context),
                        ),
                      ),
                      SizedBox(width: 10.sp),
                      SvgPicture.asset(
                        AppIcons.starRed,
                        width: 10.sp,
                        height: 10.sp,
                      ),
                      SizedBox(width: 2.sp),
                      Text(
                        "${product.totalRating}",
                        style: kTextHelperNormal1(context: context),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
