import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_app_bar.dart';
import 'package:tostinh/presentation/feature/edit_profile/controller/edit_profile_controller.dart';
import 'package:tostinh/presentation/feature/edit_profile/view/widget/edit_profile_textformfield.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          onTapLeft: () => Get.back(),
          elevation: 0,
          title: AppLocals.editProfile.tr,
          actions: [
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Text(
                  AppLocals.save.tr,
                  style: kTextHeadline3(context: context)?.copyWith(
                    color: kOnPrimaryContainerBlackGray(context: context),
                    fontSize: 17.sp,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp,),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          AppIcons.editProfileThumnail,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 3,
                          child: SvgPicture.asset(
                            AppIcons.editProfilePencil,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 11.h),
                  Text(
                    'James Bond',
                    style: kTextHeadline2(context: context),
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: EditProfileTextFormField(
                          controller: controller.txtFirstName,
                          label: AppLocals.firstName.tr,
                          isAutoFocus: true,
                          validator: (p0) {
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Expanded(
                        flex: 2,
                        child: EditProfileTextFormField(
                          controller: controller.txtLastName,
                          label: AppLocals.lastName.tr,
                          validator: (p0) {
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.w),
                  EditProfileTextFormField(
                    controller: controller.txtPhonehoneNumber,
                    label: AppLocals.addressPhone.tr,
                    validator: (p0) {
                      return null;
                    },
                  ),
                  SizedBox(height: 24.w),
                  EditProfileTextFormField(
                    controller: controller.txtEmail,
                    label: AppLocals.emailOptional.tr,
                    hintText: 'Email address',
                    validator: (p0) {
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
