import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_styles.dart';

class EditProfileTextFormField extends StatelessWidget {
  const EditProfileTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.validator,
    this.isAutoFocus = false,
  });

  final TextEditingController controller;
  final String label;
  final String? hintText;
  final Function(String)? validator;
  final bool? isAutoFocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kTextHelperBold1(context: context)?.copyWith(
            color: const Color(0XFF999999),
            fontSize: 12.sp,
          ),
        ),
        TextFormField(
          autofocus: isAutoFocus!,
          cursorHeight: 15.h,
          controller: controller,
          textInputAction: TextInputAction.next,
          style: kTextTitleBold(context: context),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.sp, horizontal: 0.sp),
            hintText: hintText,
            hintStyle: kTextTitleBold(context: context)
                ?.copyWith(color: const Color(0xff868e96)),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.red)),
            focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.red)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFCFD4DA)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFCFD4DA)),
            ),
          ),
        ),
      ],
    );
  }
}
