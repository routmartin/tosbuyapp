import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';

class PinCodeSphere extends StatelessWidget {
  final bool input;

  const PinCodeSphere({Key? key, required this.input}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.sp,
      height: 15.sp,
      margin: EdgeInsets.only(right: 25.sp),
      decoration: BoxDecoration(
        color: input ? AppColors.blackGray : null,
        border: Border.all(
          color: input ? Colors.transparent : AppColors.black,
          width: 1,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
