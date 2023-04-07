import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';

class CustomButtonBottom extends StatelessWidget {
  const CustomButtonBottom(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      width: double.infinity,
      child: CustomButtonLinear(
        backgroundColor: kInverseSurfaceBlack(context: context),
        borderRadius: 16,
        onPressed: onPressed,
        child: Text(
          title,
          style: kTextTitleBold(context: context)?.copyWith(
            color: kOnInverseSurfaceWhite(context: context),
          ),
        ),
      ),
    );
  }
}
