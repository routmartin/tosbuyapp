import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../assets/app_colors.dart';
import '../../../../../../../assets/app_styles.dart';

class ProfileInfoViewTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final bool? autofocus;
  const ProfileInfoViewTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.errorText,
    required this.keyboardType,
    this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackGray, width: .5),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
    const OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackGray, width: .5),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
    return TextFormField(
      validator: validator,
      autofocus: autofocus ?? false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.sp),
        focusedBorder: borderStyle,
        enabledBorder: borderStyle,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        focusColor: AppColors.white,
        errorText: errorText,
        hintText: hintText,
        hintStyle: kTextTitleNormal(context: context)?.copyWith(
          fontSize: 16.sp,
          height: 1.5,
        ),
      ),
    );
  }
}
