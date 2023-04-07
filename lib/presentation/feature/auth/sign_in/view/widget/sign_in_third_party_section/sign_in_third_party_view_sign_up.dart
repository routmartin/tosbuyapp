import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../assets/app_locals.dart';
import '../../../../../../../assets/app_styles.dart';

class SignInThirdPartyViewSignUp extends StatelessWidget {
  const SignInThirdPartyViewSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16.sp,
        ),
        Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Text(
            AppLocals.orContinueWith.tr,
            style: kTextDescriptionNormal(context: context)
                ?.copyWith(fontSize: 14.sp),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 16.sp,
        ),
      ],
    );
  }
}
