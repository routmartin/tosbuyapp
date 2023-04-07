import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_styles.dart';

class CustomDialogLoading extends StatelessWidget {
  const CustomDialogLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryWhite(context: context),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
        width: 90.sp,
        height: 90.sp,
        child: Padding(
          padding: EdgeInsets.all(25.sp),
          child: const CircularProgressIndicator(
            color: AppColors.pink,
          ),
        ),
      ),
    );
  }
}
