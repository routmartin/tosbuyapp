import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_circle.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../component/view/custom_app_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller;
  const HomeAppBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          leadingWidth: 100 + 16.sp,
          leading: Row(children: [
            SizedBox(width: 16.sp),
            Image.asset(
              AppIcons.slogan,
              width: 100,
              height: 50,
            ),
          ]),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorPinkVariant.lightActive,
                  kPrimaryContainerWhiteGray(context: context)
                ],
              ),
            ),
          ),
          actions: [
            IconButtonAppBar(
                onPressed: () {},
                child: SvgPicture.asset(AppIcons.notification)),
            SizedBox(
              width: 16.sp,
            )
          ],
        ),
      ),
      floating: true,
      snap: false,
      pinned: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      bottom: const HomeAppBarSearchBox(),
      expandedHeight: kToolbarHeight + kToolbarHeight,
      forceElevated: false,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 56.sp);
}

class HomeAppBarSearchBox extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeAppBarSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.sp,
          ),
          height: 36.sp,
          child: TextFormField(
            onTap: () {
              Get.toNamed(AppRoutes.searchProduct);
            },
            readOnly: true,
            decoration: kInputDecorationOutline(context: context)?.copyWith(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              fillColor: kPrimaryWhite(context: context),
              filled: true,
              enabledBorder: const OutlineInputBorder().copyWith(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.pink,
                ),
              ),
              focusedBorder: const OutlineInputBorder().copyWith(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.pink,
                ),
              ),
              hintText: AppLocals.searchProducts.tr,
              hintStyle: kTextDescriptionBold(context: context)?.copyWith(
                color: kOnPrimaryContainerBlackGray(context: context),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(8.sp),
                child: SvgPicture.asset(
                  AppIcons.search,
                  color: kOnPrimaryContainerBlackGray(context: context),
                ),
              ),
              suffixIcon: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  CustomButtonCircle(
                    onPressed: () {},
                    buttonSize: 30.sp,
                    child: SvgPicture.asset(
                      AppIcons.camera,
                      color: kOnPrimaryContainerBlackGray(context: context),
                    ),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  CustomButtonLinear(
                    onPressed: () {
                      Get.toNamed(AppRoutes.searchProduct);
                    },
                    height: 30.sp,
                    width: 67.sp,
                    backgroundColor: AppColors.pink,
                    borderRadius: 30,
                    child: Text(
                      "Search",
                      style: kTextDescriptionBold(context: context)?.copyWith(
                        color: kOnSecondaryWhite(context: context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.sp,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.sp);
}
