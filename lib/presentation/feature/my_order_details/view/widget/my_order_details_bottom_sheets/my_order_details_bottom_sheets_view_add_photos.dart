import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';

class MyOrderDetailsBottomSheetsViewAddPhotos extends StatelessWidget {
  final  Function() onPressed;
  const MyOrderDetailsBottomSheetsViewAddPhotos(
      {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtonLinear(
      onPressed: onPressed,
      borderRadius: 6,
      width: 110.sp,
      height: 110.sp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 52.sp,
            height: 52.sp,
            child: SvgPicture.asset(
              AppIcons.reviewAddImage,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            AppLocals.reviewAddYourPhotos.tr,
            style: kTextHelperNormal2(context: context),
          )
        ],
      ),
    );
  }
}
