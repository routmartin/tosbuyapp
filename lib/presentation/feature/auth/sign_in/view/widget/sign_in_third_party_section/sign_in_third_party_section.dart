import 'package:flutter/material.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/view/widget/sign_in_third_party_section/sign_in_third_party_view_other_sign_in.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/view/widget/sign_in_third_party_section/sign_in_third_party_view_sign_up.dart';

class SignInThirdPartySection extends StatelessWidget {
  const SignInThirdPartySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SignInThirdPartyViewSignUp(),
        SignInThirdPartyViewOtherSignIn(),
      ],
    );
  }
}
