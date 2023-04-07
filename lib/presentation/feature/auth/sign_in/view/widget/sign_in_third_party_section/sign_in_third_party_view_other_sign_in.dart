import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../assets/app_icons.dart';
import 'sign_in_third_party_view_sign_in_with_button.dart';

class SignInThirdPartyViewOtherSignIn extends StatelessWidget {
  const SignInThirdPartyViewOtherSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14.sp),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInThirdPartyViewSignInWithButton(
              iconPath: AppIcons.authGoogle,
              onPressed: () {},
            ),
            SizedBox(width: 30.sp),
            SignInThirdPartyViewSignInWithButton(
              iconPath: AppIcons.authFacebook,
              onPressed: () {},
            ),
            SizedBox(width: 20.sp),
            SignInThirdPartyViewSignInWithButton(
              iconPath: AppIcons.authApple,
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
