import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/controller/sign_in_controller.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/view/widget/sign_in_info_section/sign_in_info_section.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/view/widget/sign_in_input_section/sign_in_input_section.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/view/widget/sign_in_third_party_section/sign_in_third_party_section.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SignInInfoSection(),
                ),
                SliverToBoxAdapter(
                  child: SignInInputSection(
                    controller: controller,
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SignInThirdPartySection(),
                      SizedBox(
                        height: 16.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
