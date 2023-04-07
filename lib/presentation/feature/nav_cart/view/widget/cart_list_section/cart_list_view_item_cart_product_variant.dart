import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/cart_response.dart';

class CartListViewItemCartProductVariant extends StatelessWidget {
  final Product product;
  const CartListViewItemCartProductVariant({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.sp,
      margin: EdgeInsets.symmetric(vertical: 2.sp),
      padding: EdgeInsets.symmetric(
        vertical: 3.sp,
        horizontal: 6.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.sp),
        color: kPrimaryContainerWhiteGray(context: context),
      ),
      child: ListView.builder(
        itemCount: product.variants?.options.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final option = product.variants!.options[index];
          return Text(
            "${option.optionName}:${option.optionValue}${product.variants!.options.length - 1 != index ? ", " : ""}",
            overflow: TextOverflow.ellipsis,
            style: kTextHelperNormal2(context: context),
          );
        },
      ),
    );
  }
}
