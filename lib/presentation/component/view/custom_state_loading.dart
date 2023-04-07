import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';

class CustomStateLoading extends StatelessWidget {
  const CustomStateLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: const CircularProgressIndicator.adaptive(
            backgroundColor: AppColors.red,
        ),
      ),
    );
  }
}
