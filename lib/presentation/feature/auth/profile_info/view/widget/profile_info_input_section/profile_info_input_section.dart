import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/controller/profile_info_controller.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/view/widget/profile_info_input_section/profile_info_input_view_email.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/view/widget/profile_info_input_section/profile_info_input_view_last_name.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/view/widget/profile_info_input_section/profile_info_input_view_phone_number.dart';

import 'profile_info_input_view_first_name.dart';

class ProfileInfoInputSection extends StatelessWidget {
  final ProfileInfoController controller;
  const ProfileInfoInputSection({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
          child: Column(
        children: [
          ProfileInfoInputViewFirstName(
            controller: controller,
          ),
          SizedBox(height: 14.sp),
          ProfileInfoInputViewLastName(
            controller: controller,
          ),
          SizedBox(
            height: 14.sp,
          ),
          ProfileInfoInputViewPhoneNumber(
            controller: controller,
          ),
          SizedBox(
            height: 14.sp,
          ),
          ProfileInfoInputViewEmail(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
