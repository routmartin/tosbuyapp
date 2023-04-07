import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../assets/app_styles.dart';

class PromotionListViewItemIcon extends StatelessWidget {
  final String iconPath;
  final String label;

  const PromotionListViewItemIcon({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          color: kOnSurfaceVariantBlackGray(context: context),
          width: 24.sp,
          height: 24.sp,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(height: 4.sp),
        Text(label, style: kTextHelperNormal2(context: context)),
      ],
    );
  }
}
