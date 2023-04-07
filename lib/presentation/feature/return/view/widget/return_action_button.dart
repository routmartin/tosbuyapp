import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';

import '../../../../../assets/app_colors.dart';

class ReturnActionButton extends StatelessWidget {
  const ReturnActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Complete Return',
          style: kTextDescriptionBold(context: context)
              ?.copyWith(color: AppColors.pink),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(width: .5.sp, color: AppColors.red),
          ),
          child: Text(
            'Cancel Return',
            style: kTextDescriptionBold(context: context)
                ?.copyWith(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
