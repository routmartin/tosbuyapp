import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_colors.dart';

import '../../../../../assets/app_styles.dart';

class WishlistActionButton extends StatelessWidget {
  const WishlistActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isActive = true,
  });
  final String icon;
  final bool isActive;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 30.sp,
        height: 30.sp,
        padding: EdgeInsets.all(6.sp),
        decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: kOnPrimaryBlack(context: context).withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]),
        child: SvgPicture.asset(
          icon,
          color: isActive ? AppColors.pink : AppColors.blackGray,
        ),
      ),
    );
  }
}
