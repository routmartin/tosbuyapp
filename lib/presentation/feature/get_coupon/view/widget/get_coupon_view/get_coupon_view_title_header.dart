import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';

class GetCouponViewTitleHeader extends StatelessWidget {
  final String title;
  const GetCouponViewTitleHeader({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Text(
        title,
        style: kTextTitleBold(context: context),
      ),
    );
  }
}
