import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';

class CustomStateEndLoading extends StatelessWidget {
  const CustomStateEndLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      height: 60.sp,
      child: const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.red,
        ),
      ),
    );
  }
}
