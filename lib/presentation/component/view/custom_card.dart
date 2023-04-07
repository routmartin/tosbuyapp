import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../assets/app_styles.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: kPrimaryWhite(context: context),
        boxShadow: [
          BoxShadow(
            color: kOnPrimaryBlack(context: context).withOpacity(.12),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
