import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/navigation/controller/nav_controller.dart';

import '../../../../assets/app_icons.dart';

class NavPage extends StatelessWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      init: NavController(),
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex,
            children: controller.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kPrimaryWhite(context: context),
            selectedItemColor: kInverseSurfaceBlack(context: context),
            unselectedItemColor: kOnSurfaceVariantBlackGray(context: context),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.navHome,
                  width: 30.sp,
                  height: 30.sp,
                ),
                activeIcon: SvgPicture.asset(
                  AppIcons.navHome,
                  width: 30.sp,
                  height: 30.sp,
                  color: kOnPrimaryBlack(context: context),
                ),
                label: "Home",
                backgroundColor: kPrimaryWhite(context: context),
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.navWatch,
                    width: 30.sp,
                    height: 30.sp,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppIcons.navWatch,
                    width: 30.sp,
                    height: 30.sp,
                    color: kOnPrimaryBlack(context: context),
                  ),
                  label: "Watch",
                  backgroundColor: AppColors.black),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.navChat,
                  width: 30.sp,
                  height: 30.sp,
                ),
                activeIcon: SvgPicture.asset(
                  AppIcons.navChat,
                  width: 30.sp,
                  height: 30.sp,
                  color: kOnPrimaryBlack(context: context),
                ),
                label: "Chat",
                backgroundColor: kPrimaryWhite(context: context),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.navCart,
                  width: 30.sp,
                  height: 30.sp,
                ),
                activeIcon: SvgPicture.asset(
                  AppIcons.navCart,
                  width: 30.sp,
                  height: 30.sp,
                  color: kOnPrimaryBlack(context: context),
                ),
                label: "Cart",
                backgroundColor: kPrimaryWhite(context: context),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.navAccount,
                  width: 30.sp,
                  height: 30.sp,
                ),
                activeIcon: SvgPicture.asset(
                  AppIcons.navAccount,
                  width: 30.sp,
                  height: 30.sp,
                  color: kOnPrimaryBlack(context: context),
                ),
                label: "Profile",
                backgroundColor: kPrimaryWhite(context: context),
              ),
            ],
            currentIndex: controller.selectedIndex,
            onTap: controller.onItemTapped,
          ),
        );
      },
    );
  }
}
