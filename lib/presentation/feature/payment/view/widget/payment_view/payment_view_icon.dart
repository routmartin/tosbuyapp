import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../assets/app_colors.dart';

class PaymentViewIcon extends StatelessWidget {
  final String asset;

  const PaymentViewIcon({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.sp,
      height: 50.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: ColorPinkVariant.lightActive,
      ),
      child: SvgPicture.asset(asset),
    );
  }
}
