import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';

class PaymentAmountViewFee extends StatelessWidget {
  final String title;
  final String data;
  final Color? color;
  final Function()? onPressed;

  const PaymentAmountViewFee({
    Key? key,
    required this.title,
    required this.data,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kTextDescriptionBold(context: context)?.copyWith(
              color: kOnPrimaryContainerBlackGray(context: context),
            ),
          ),
          GestureDetector(
            onTap: () => onPressed?.call(),
            child: Text(
              data,
              style: kTextDescriptionBold(context: context)?.copyWith(
                color: color ?? kOnPrimaryBlack(context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
