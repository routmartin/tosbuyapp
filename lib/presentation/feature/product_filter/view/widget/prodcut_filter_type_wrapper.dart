import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductFilterTypeWrapper extends StatelessWidget {
  const ProductFilterTypeWrapper({
    Key? key,
    required this.filterHeader,
    required this.child,
    this.height,
  }) : super(key: key);

  final String filterHeader;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.only(bottom: 5.sp),
      height: height ?? 140.sp,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            filterHeader,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
