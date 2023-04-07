import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/auth/otp/view/widget/verify_otp_input_section/verify_otp_input_view_count_down.dart';
import '../../../../../../../assets/app_colors.dart';
import '../../../../../../../assets/app_locals.dart';
import '../../../../../../../assets/app_styles.dart';
import '../../../controller/verify_otp_controller.dart';

class VerifyOtpInputSection extends StatelessWidget {
  final VerifyOtpController controller;
  const VerifyOtpInputSection({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackGray, width: .5),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
    return TextFormField(
      controller: controller.txtOtpCodeController,
      onEditingComplete: () {
        controller.signInWithPhoneNumber();
      },
      textInputAction: TextInputAction.next,
      showCursor: true,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.sp),
        focusedBorder: borderStyle,
        enabledBorder: borderStyle,
        hintText: AppLocals.code.tr,
        hintStyle: kTextTitleNormal(context: context)?.copyWith(
          fontSize: 16.sp,
        ),
        suffix: Container(
          padding: EdgeInsets.only(right: 20.sp),
          child: VerifyOtpInputViewCountDown(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
