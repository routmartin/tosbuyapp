import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/controller/sign_in_controller.dart';

import '../../../../../../../assets/app_colors.dart';
import '../../../../../../../assets/app_styles.dart';

class SignInInputViewPhoneNumber extends StatelessWidget {
  final SignInController controller;
  const SignInInputViewPhoneNumber({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackGray, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );

    OutlineInputBorder errorBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );

    return TextFormField(
      controller: controller.textInputPhoneController,
      onEditingComplete: () {
        controller.requestOtp();
      },
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      showCursor: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.sp),
        focusedBorder: borderStyle,
        enabledBorder: borderStyle,
        focusedErrorBorder: errorBorderStyle,
        errorText: controller.errorTextInput,
        hintText: AppLocals.phoneNumber.tr,
        hintStyle: kTextTitleNormal(context: context)?.copyWith(
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
