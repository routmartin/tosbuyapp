import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/component/view/custom_button_circle.dart';

import '../../../../../../../assets/app_styles.dart';

class SignInThirdPartyViewSignInWithButton extends StatelessWidget {
  const SignInThirdPartyViewSignInWithButton({
    Key? key,
    required this.iconPath,
    required this.onPressed,
  }) : super(key: key);

  final String iconPath;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButtonCircle(
      onPressed: onPressed,
          child: Container(
        padding: EdgeInsets.all(7.sp),
        width: 50.sp,
        height: 50.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.sp),
            color: kPrimaryWhite(context: context),
            boxShadow: [
              BoxShadow(
                offset: const Offset(.0, .0),
                blurRadius: 10,
                color: Colors.black.withOpacity(.1),
              )
            ]),
        child: Image.asset(iconPath),
      ),
    );
  }
}
