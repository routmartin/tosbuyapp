import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';

import '../../../../../../assets/app_icons.dart';

class ProfileSettingViewItemArrow extends StatelessWidget {
  const ProfileSettingViewItemArrow(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      onPressed: onPressed,
      height: 50.sp,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.sp),
              child: Text(
                title,
                style: kTextDescriptionBold(context: context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 22.sp),
            child: SvgPicture.asset(AppIcons.arrowForward),
          )
        ],
      ),
    );
  }
}
