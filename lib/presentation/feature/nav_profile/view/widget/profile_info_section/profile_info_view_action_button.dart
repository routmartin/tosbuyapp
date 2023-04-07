import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_button_circle_shadow.dart';

class ProfileInfoViewActionButton extends StatelessWidget {
  const ProfileInfoViewActionButton({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonCircleShadow(
          onPressed: onPressed,
          buttonSize: 50.sp,
          child: SvgPicture.asset(
            iconPath,
            width: 28.sp,
            height: 28.sp,
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        Text(
          title,
          style: kTextDescriptionBold(context: context),
        ),
      ],
    );
  }
}
