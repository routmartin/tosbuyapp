import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';
import 'package:tostinh/utils/helper/screen_helper.dart';

class HomeFlashSaleViewProducts extends StatelessWidget {
  const HomeFlashSaleViewProducts({super.key, required this.controller});
  final HomeController controller;

  Widget _buildMobileLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildItemProduct(context, 1),
        _buildItemProduct(context, 1),
        _buildItemProduct(context, 1),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildItemProduct(context, 1),
        _buildItemProduct(context, 1),
        _buildItemProduct(context, 1),
        _buildItemProduct(context, 1),
      ],
    );
  }

  Widget _validateScreen(BuildContext context) {
    switch (ScreenHelper.screenType(context)) {
      case ScreenType.mobile:
        return _buildMobileLayout(context);
      case ScreenType.tablet:
        return _buildTabletLayout(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _validateScreen(context);
  }

  Widget _buildItemProduct(BuildContext context, int index) {
    return SizedBox(
      width: 104.sp,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            _buildImageProduct(context: context),
            _buildInfo(context: context)
          ],
        ),
      ),
    );
  }

  Widget _buildImageProduct({required BuildContext context}) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          CustomCachedImage(
            imageUrl: "https://picsum.photos/id/1/1920/1080",
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(10),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.bgDiscount,
                  width: 40.sp,
                  height: 16.sp,
                  fit: BoxFit.scaleDown,
                ),
                Text(
                  "-70%",
                  style: kTextHelperBold1(context: context)?.copyWith(
                    color: kOnSecondaryWhite(context: context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfo({required BuildContext context}) {
    return Column(
      children: [
        SizedBox(
          height: 10.sp,
        ),
        Material(
          borderRadius: BorderRadius.circular(16),
          color: kSecondaryBlack(context: context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
            child: Text(
              "29 Sold",
              style: kTextHelperNormal1(context: context)?.copyWith(
                color: kOnSecondaryWhite(context: context),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "\$68.00",
              style: kTextDescriptionBold(context: context)?.copyWith(
                color: AppColors.red,
              ),
            ),
            Text(
              "\$60.00",
              style: kTextHelperLineThrough(context: context),
            ),
          ],
        ),
      ],
    );
  }
}
