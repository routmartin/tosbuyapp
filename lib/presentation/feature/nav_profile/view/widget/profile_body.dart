import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/presentation/component/view/custom_button_bottom.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../../assets/app_styles.dart';
import '../../controller/profile_controller.dart';
import 'profile_info_section/profile_info_section.dart';
import 'profile_setting_section/profile_setting_section.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key, required this.controller}) : super(key: key);
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return CustomRequestIndicator(
      onLoad: controller.requestProfileDetail,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  height: 258.sp,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    AppIcons.backgroundProfile,
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.sp, right: 16.sp, top: 63.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: kTextHeadline1(context: context)?.copyWith(
                            color: kOnSecondaryWhite(context: context),
                          ),
                        ),
                        SizedBox(
                          height: 16.sp,
                        ),
                        ProfileInfoSection(
                          controller: controller,
                        ),
                        SizedBox(
                          height: 16.sp,
                        ),
                        ProfileSettingSection(
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: CustomButtonBottom(
              onPressed: () {
                controller.signOut();
              },
              title: 'Log out',
            ),
          )
        ],
      ),
    );
  }
}
