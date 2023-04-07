import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../controller/profile_controller.dart';
import 'profile_setting_view_item_arrow.dart';
import 'profile_setting_view_item_switch.dart';

class ProfileSettingSection extends StatelessWidget {
  const ProfileSettingSection({Key? key, required this.controller})
      : super(key: key);
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kOnSecondaryWhite(context: context),
      elevation: 10,
      shadowColor:
          kPrimaryContainerWhiteGray(context: context).withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ProfileSettingViewItemArrow(
              title: AppLocals.myCoupon.tr,
              onPressed: () {
                Get.toNamed(AppRoutes.coupon);
              },
            ),
            ProfileSettingViewItemArrow(
              title: AppLocals.editProfile.tr,
              onPressed: () => Get.toNamed(AppRoutes.editProfile),
            ),
            ProfileSettingViewItemArrow(
              title: AppLocals.changePin.tr,
              onPressed: () {},
            ),
            ProfileSettingViewItemArrow(
              title: AppLocals.returnProduct.tr,
              onPressed: () => Get.toNamed(AppRoutes.returns),
            ),
            ProfileSettingViewItemSwitch(
              title: AppLocals.pushNotifications.tr,
              isActive: controller.isNotificationEnabled,
              onPressed: (bool val) {},
            ),
          ],
        ),
      ),
    );
  }
}
