import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';

class ProductDetailOrderSectionAmount extends StatelessWidget {
  final double? amount;

  ProductDetailOrderSectionAmount({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = int.parse(amount.toString().split(".")[0]);
    final decimal = int.parse(amount.toString().split(".")[1]);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$ ",
          style: kTextHeadline2(context: context)?.copyWith(
            fontSize: 13.sp,
            color: kPrimaryWhite(context: context),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$price",
                style: kTextHeadline2(context: context)?.copyWith(
                  color: kPrimaryWhite(context: context),
                ),
              ),
              TextSpan(
                text: ".${decimal}",
                style: kTextDescriptionNormal(context: context)?.copyWith(
                  color: kPrimaryWhite(context: context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
