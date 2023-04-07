import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_app_bar.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/controller/profile_info_controller.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/view/widget/profile_info_info_section/profile_info_info_section.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/view/widget/profile_info_input_section/profile_info_input_section.dart';

import '../../../../../assets/app_icons.dart';
import 'widget/profile_info_input_section/profile_info_input_view_first_name.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTapLeft: () {},
        elevation: 0,
        isHideLeading: true,
        title: "",
        actions: [
          TextButtonAppBar(
            onPressed: () {},
            child: Text(
              AppLocals.next.tr,
              style: kTextHeadline3(context: context),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: GetBuilder<ProfileInfoController>(
              init: ProfileInfoController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileInfoInfoSection(),
                    SizedBox(height: 40.sp),
                    ProfileInfoInputSection(controller: controller),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
