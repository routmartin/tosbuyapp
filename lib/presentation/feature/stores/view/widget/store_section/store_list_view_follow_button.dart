import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_button_linear.dart';

class StoreListViewFollowButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const StoreListViewFollowButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      backgroundColor: kOnPrimaryBlack(context: context),
      borderRadius: 8.sp,
      onPressed: () => onPressed.call(),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.followStore),
            SizedBox(width: 7.sp),
            Text(
              label,
              style: kTextDescriptionNormal(context: context)?.copyWith(
                color: kPrimaryWhite(context: context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
