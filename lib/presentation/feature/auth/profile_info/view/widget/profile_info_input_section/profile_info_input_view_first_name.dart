import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/controller/profile_info_controller.dart';
import 'package:tostinh/presentation/feature/auth/profile_info/view/widget/profile_info_view/profile_info_view_text_field.dart';


class ProfileInfoInputViewFirstName extends StatelessWidget {
  final ProfileInfoController controller;

  const ProfileInfoInputViewFirstName({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ProfileInfoViewTextField(
      controller: controller.firstNameController,
      validator: (value) {
                if (value == null || value.isEmpty) {
          return AppLocals.signUpFieldRequired.tr;
        }
        return null;
      },
      hintText: AppLocals.firstName.tr,
      errorText: controller.errorFirstName,
      keyboardType: TextInputType.name,
    );
  }
}
