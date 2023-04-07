import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../assets/app_icons.dart';
import '../../../../../../../assets/app_locals.dart';
import '../../../../../../../assets/app_styles.dart';
import '../../../controller/verify_otp_controller.dart';

class VerifyOtpInfoSection extends StatelessWidget {
  final VerifyOtpController controller;
  const VerifyOtpInfoSection({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: SvgPicture.asset(AppIcons.verifyOTP),
        ),
        SizedBox(height: 20.sp),
        Text(
          AppLocals.verifyOTP.tr,
          style: kTextHeadline2(context: context),
        ),
        SizedBox(height: 5.sp),
        Text(
          '${AppLocals.otpMessage.tr} ${controller.loginRequestBody.phone}',
          textAlign: TextAlign.center,
          style: kTextDescriptionNormal(context: context)
              ?.copyWith(height: 1.6.sp),
        ),
        SizedBox(
          height: 40.sp,
        )
      ],
    );
  }
}
