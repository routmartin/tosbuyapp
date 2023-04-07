import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderDetailsBottomSheetsViewItemPhotosReview extends StatelessWidget {
  final Function() onPressed;
  final String imagePath;
  const MyOrderDetailsBottomSheetsViewItemPhotosReview(
      {Key? key,required this.onPressed, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
          child: Container(
        width: 110.sp,
        height: 110.sp,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
