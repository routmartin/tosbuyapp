import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';

import '../../../../../../assets/app_styles.dart';

class CategoryTypeButton extends StatelessWidget {
  final VoidCallback action;
  final bool isActive;
  const CategoryTypeButton({
    Key? key,
    required this.action,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 12.sp),
      margin: EdgeInsets.only(left: 7.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.sp),
        color: isActive ? AppColors.black : const Color(0XFFF1F1F1),
      ),
      child: Text(
        'Electronic',
        style: kTextDescriptionBold(context: context)
            ?.copyWith(color: isActive ? AppColors.white : AppColors.blackGray),
      ),
    );
  }
}
