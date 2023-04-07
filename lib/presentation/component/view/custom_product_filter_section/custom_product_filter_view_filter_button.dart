import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../assets/app_styles.dart';

class CustomProductFilterViewFilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String title;
  const CustomProductFilterViewFilterButton(
      {super.key,
      required this.onPressed,
      required this.iconPath,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconPath,
        width: 24.sp,
        height: 24.sp,
        fit: BoxFit.cover,
      ),
      label: Text(
        title,
        style: kTextHelperNormal2(context: context),
      ),
    );
  }
}
