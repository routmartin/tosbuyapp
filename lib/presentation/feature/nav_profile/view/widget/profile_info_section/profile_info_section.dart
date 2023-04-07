import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_button_circle.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../controller/profile_controller.dart';
import 'profile_info_view_action_button.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({Key? key, required this.controller})
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
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(22.sp),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kSecondaryContainerBlackGray(context: context),
                    ),
                    clipBehavior: Clip.hardEdge,
                    width: 50.sp,
                    height: 50.sp,
                    child: CustomCachedImage(
                      imageUrl: controller
                          .profileDetailResult.successResponse?.data?.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        child: SvgPicture.asset(
                          AppIcons.navAccount,
                          color: kOnInverseSurfaceWhite(context: context),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: SizedBox(
                        height: 50.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${controller.profileDetailResult.successResponse?.data?.firstName}"
                              " "
                              "${controller.profileDetailResult.successResponse?.data?.lastName}",
                              style: kTextHeadline3(context: context),
                            ),
                            Text(
                              "${controller.profileDetailResult.successResponse?.data?.phone}",
                              style: kTextDescriptionNormal(context: context)
                                  ?.copyWith(
                                color: kOnSurfaceVariantBlackGray(
                                  context: context,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomButtonCircle(
                    onPressed: () {},
                    buttonSize: 30.sp,
                    child: Image.asset(
                      AppIcons.flagCambodia,
                      width: 30.sp,
                      height: 30.sp,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              color: kPrimaryContainerWhiteGray(context: context),
            ),
            Padding(
              padding: EdgeInsets.all(22.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileInfoViewActionButton(
                    title: AppLocals.myOrder.tr,
                    iconPath: AppIcons.handbag,
                    onPressed: () {
                      Get.toNamed(AppRoutes.myOrder);
                    },
                  ),
                  ProfileInfoViewActionButton(
                    title: AppLocals.myAddress.tr,
                    iconPath: AppIcons.location,
                    onPressed: () {
                      Get.toNamed(AppRoutes.address);
                    },
                  ),
                  ProfileInfoViewActionButton(
                    title: AppLocals.myWishlist.tr,
                    iconPath: AppIcons.loveWishlist,
                    onPressed: () => Get.toNamed(AppRoutes.wishlish),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
