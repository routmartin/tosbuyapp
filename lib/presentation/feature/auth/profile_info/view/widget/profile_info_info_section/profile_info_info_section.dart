import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../assets/app_icons.dart';
import '../../../../../../../assets/app_locals.dart';
import '../../../../../../../assets/app_styles.dart';

class ProfileInfoInfoSection extends StatelessWidget {
  const ProfileInfoInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: SvgPicture.asset(AppIcons.profileInfo),
        ),
        SizedBox(height: 20.sp),
        Text(
          AppLocals.profileInfo.tr,
          style: kTextHeadline2(context: context),
        ),
        SizedBox(height: 5.sp),
        Text(
          AppLocals.inputYourName.tr,
          textAlign: TextAlign.center,
          style: kTextDescriptionNormal(context: context)
              ?.copyWith(height: 1.6.sp),
        ),
      ],
    );
  }
}
