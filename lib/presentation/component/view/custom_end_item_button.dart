import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_styles.dart';
import 'custom_button_linear.dart';

class CustomSliverEndItemButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomSliverEndItemButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomButtonLinear(
        onPressed: onPressed,
        width: double.infinity,
        height: 50.sp,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: kTextTitleNormal(context: context)
                ?.copyWith(color: AppColors.red),
          ),
        ),
      ),
    );
  }
}
