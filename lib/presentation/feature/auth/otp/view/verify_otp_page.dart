import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_app_bar.dart';
import 'package:tostinh/presentation/feature/auth/otp/view/widget/verify_otp_input_section/verify_otp_input_section.dart';

import '../controller/verify_otp_controller.dart';
import 'widget/verify_otp_info_section/verify_otp_info_section.dart';
class VerifyOTPPage extends StatelessWidget {
  const VerifyOTPPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyOtpController>(
      init: VerifyOtpController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            onTapLeft: () {},
            elevation: 0,
            isHideLeading: true,
            title: "",
            actions: [
              TextButtonAppBar(
                child: Text(
                  AppLocals.next.tr,
                  style: kTextHeadline3(context: context)?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  controller.signInWithPhoneNumber();
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VerifyOtpInfoSection(controller: controller,),
                  VerifyOtpInputSection(controller: controller,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
