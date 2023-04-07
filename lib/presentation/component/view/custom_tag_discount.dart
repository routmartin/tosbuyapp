import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_styles.dart';

class CustomTagDiscount extends StatelessWidget {
  final String title;
  const CustomTagDiscount({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.bgDiscount,
          width: 40.sp,
          height: 16.sp,
        ),
        Text(
          title,
          style: kTextHelperBold1(context: context)
              ?.copyWith(color: AppColors.white),
        )
      ],
    );
  }
}
