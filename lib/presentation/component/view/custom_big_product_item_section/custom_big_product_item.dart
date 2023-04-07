import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';

import '../../../../../../assets/app_styles.dart';
import '../custom_discount_shape.dart';
import 'custom_big_product_item_footer.dart';

class CustomBigProductItem extends StatelessWidget {
  const CustomBigProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      color: kSurfaceWhite(context: context),
      child: Column(
        children: [
          Stack(
            children: [
              const AspectRatio(
                aspectRatio: 1,
                child: CustomCachedImage(
                  imageUrl:
                      "https://cdn.webnews.it/RQz-TZmRC-QiwrHBmHPNOceeCuk=/2160x1350/https://www.webnews.it/app/uploads/2022/04/telefoninonet-iv-2160x1350-30.jpg",
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
                      "70%",
                      style: kTextHelperBold1(context: context)?.copyWith(
                        color: kPrimaryWhite(context: context),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const CustomBigProductItemFooter(),
        ],
      ),
    );
  }
}
