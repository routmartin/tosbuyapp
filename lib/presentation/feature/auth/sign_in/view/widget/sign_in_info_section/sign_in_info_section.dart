import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../assets/app_icons.dart';
import '../../../../../../../assets/app_locals.dart';
import '../../../../../../../assets/app_styles.dart';

class SignInInfoSection extends StatelessWidget {
  const SignInInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.sp,
        ),
        SizedBox(
          width: Get.width,
          child: Image.asset(
            width: 118.sp,
            height: 118.sp,
            AppIcons.appLogo,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 16.sp),
        Text(
          AppLocals.welcomeBank.tr,
          style: kTextHeadline2(context: context),
        ),
        Text(
          AppLocals.signInPleaseInputPhoneNumberDescription.tr,
          style: kTextDescriptionNormal(context: context),
        ),
        SizedBox(
          height: 40.sp,
        ),
      ],
    );
  }
}
